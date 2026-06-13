# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Convert an OWL/RDF ontology into a Synalog program.

`synalog import ontology.owl` reads an ontology with rdflib (any RDF
serialization: RDF/XML `.owl`, Turtle `.ttl`, `.rdf`, `.n3`, JSON-LD, …) and
prints a Synalog program to stdout, ready to redirect into a `.l` file:

    synalog import ontology.owl > ontology.l

The mapping follows the project's knowledge-graph conventions:

* an OWL/RDFS **class** becomes a ``*Node`` concept keyed by the individual's
  URI (preserved verbatim), with one column per **datatype property** whose
  domain is that class;
* an OWL **object property** becomes a ``*Edge`` concept joining two nodes
  through their URIs;
* ``rdfs:subClassOf`` between named classes becomes a recursive
  ``SubClassOfEdge`` (the transitive closure of the hierarchy);
* **individuals** (the ABox) are emitted as ``*Raw`` facts that the concepts
  build on, so the generated program runs as-is.

Datatype values keep their natural type (numbers, booleans) where rdflib can
infer it, and strings are emitted as single-quoted literals (Synalog's string
form that tolerates embedded double quotes). A datatype property a given
individual lacks is filled with ``null`` so every row of a node has the same
arity.
"""

from __future__ import annotations

import re

# ---------------------------------------------------------------------------
# Names and literals
# ---------------------------------------------------------------------------

_PASCAL_SPLIT = re.compile(r"[^0-9A-Za-z]+")


def _local(uri: str) -> str:
    """The local name of a URI: the part after the last ``#``, ``/`` or ``:``."""
    text = str(uri)
    for sep in ("#", "/"):
        if sep in text:
            text = text.rsplit(sep, 1)[1]
    if ":" in text:  # leftover prefix (e.g. a CURIE that survived)
        text = text.rsplit(":", 1)[1]
    return text or str(uri)


def _pascal(name: str) -> str:
    parts = _PASCAL_SPLIT.split(name)
    return "".join(p[:1].upper() + p[1:] for p in parts if p)


def _safe_var(name: str) -> str:
    """A lowercase Logica variable/field name derived from ``name``."""
    var = re.sub(r"[^0-9A-Za-z]+", "_", _local(name)).strip("_").lower()
    if not var or var[0].isdigit():
        var = f"p_{var}".rstrip("_")
    return var


def _string_literal(value: str) -> str:
    """Render a Python string as a single-quoted Synalog literal.

    Single-quoted strings are used because, unlike the double-quoted form, they
    tolerate the double quotes that show up in ontology labels and comments.
    Backslashes and single quotes are escaped; newlines/tabs are flattened to
    spaces so a multi-line label stays on one line.
    """
    text = str(value).replace("\\", "\\\\").replace("'", "\\'")
    text = re.sub(r"\s+", " ", text).strip()
    return f"'{text}'"


def _value_literal(value) -> str:
    """Render an rdflib term's Python value as a Synalog literal."""
    py = value.toPython() if hasattr(value, "toPython") else value
    if isinstance(py, bool):
        return "true" if py else "false"
    if isinstance(py, int):
        return str(py)
    if isinstance(py, float):
        return repr(py)
    return _string_literal(py)


class _Names:
    """Hands out unique PascalCase predicate names, suffixing on collision."""

    def __init__(self) -> None:
        self._used: dict[str, int] = {}

    def unique(self, base: str) -> str:
        if base in self._used:
            self._used[base] += 1
            return f"{base}{self._used[base]}"
        self._used[base] = 1
        return base


# ---------------------------------------------------------------------------
# Conversion
# ---------------------------------------------------------------------------


def is_url(source: str) -> bool:
    """True if ``source`` is an http(s)/ftp URL rather than a local path."""
    return bool(re.match(r"^(https?|ftp)://", source, re.IGNORECASE))


def convert(source: str) -> str:
    """Parse the ontology at ``source`` (a file path or URL) and return Synalog.

    rdflib downloads URLs itself (following redirects) and guesses the format
    from the extension or HTTP ``Content-Type``; for sources it can't classify
    (e.g. a ``.owl`` actually serialized as Turtle) the common serializations
    are tried in turn.
    """
    import rdflib

    # rdflib's `location=` accepts both a URL and a local file path.
    def parse(fmt: str | None) -> "rdflib.Graph":
        graph = rdflib.Graph()
        graph.parse(location=source, format=fmt)
        return graph

    try:
        graph = parse(None)
    except Exception:
        last = None
        for fmt in ("xml", "turtle", "n3", "json-ld", "nt"):
            try:
                graph = parse(fmt)
                break
            except Exception as e:  # noqa: PERF203 - try each serialization
                last = e
        else:
            raise last if last else RuntimeError("could not parse ontology")
    return convert_graph(graph)


def convert_graph(graph) -> str:
    """Build a Synalog program from an in-memory rdflib graph."""
    import rdflib
    from rdflib.namespace import OWL, RDF, RDFS

    URIRef = rdflib.URIRef

    def named(term) -> bool:
        return isinstance(term, URIRef)

    # Classes: explicit owl:Class / rdfs:Class plus anything used as a type.
    classes: set = set()
    for cls in graph.subjects(RDF.type, OWL.Class):
        if named(cls):
            classes.add(cls)
    for cls in graph.subjects(RDF.type, RDFS.Class):
        if named(cls):
            classes.add(cls)

    # Datatype properties grouped by their domain class; object properties with
    # their (optional) domain and range.
    datatype_props: dict = {}  # class -> [prop, ...]
    for prop in graph.subjects(RDF.type, OWL.DatatypeProperty):
        if not named(prop):
            continue
        for domain in graph.objects(prop, RDFS.domain):
            if named(domain):
                classes.add(domain)
                datatype_props.setdefault(domain, [])
                if prop not in datatype_props[domain]:
                    datatype_props[domain].append(prop)

    object_props: list = []  # (prop, domain|None, range|None)
    for prop in graph.subjects(RDF.type, OWL.ObjectProperty):
        if not named(prop):
            continue
        domain = next((d for d in graph.objects(prop, RDFS.domain) if named(d)), None)
        rng = next((r for r in graph.objects(prop, RDFS.range) if named(r)), None)
        if domain:
            classes.add(domain)
        if rng:
            classes.add(rng)
        object_props.append((prop, domain, rng))

    # Stable ordering everywhere so output is deterministic.
    classes_sorted = sorted(classes, key=str)
    for key in datatype_props:
        datatype_props[key].sort(key=str)
    object_props.sort(key=lambda t: str(t[0]))

    class_set = set(classes_sorted)

    # Individuals: subjects typed as one of our classes (the ABox).
    members: dict = {cls: [] for cls in classes_sorted}  # class -> [individual]
    for cls in classes_sorted:
        for ind in graph.subjects(RDF.type, cls):
            if named(ind):
                members[cls].append(ind)
    for cls in members:
        members[cls].sort(key=str)

    # The output has two layers, so a class-centric ontology (lots of classes,
    # no individuals — e.g. an OBO taxonomy) and an instance-rich one (FOAF, an
    # HR model) are both useful:
    #   * the SCHEMA layer is always emitted — every class is a row of `ClassNode`
    #     and the `rdfs:subClassOf` hierarchy is a recursive `SubClassOfEdge`;
    #   * the INSTANCE layer adds a per-class `*Node` (+ facts) only for classes
    #     that actually have individuals, so classes-as-entities don't spam the
    #     output with thousands of empty one-row node predicates.
    entity_classes = [cls for cls in classes_sorted if members[cls]]

    # Reserve the fixed schema predicate names so a class literally named
    # "Class" (or a "SubClassOf" property) gets a suffixed entity-node name.
    names = _Names()
    names.unique("ClassNode")
    names.unique("SubClassOfEdge")

    # A node's columns are data-driven: the datatype properties declared for the
    # class PLUS any literal-valued property its individuals actually use. The
    # data-driven part is what makes inheritance work — an individual typed as a
    # subclass still gets the (super)class's properties, and properties with no
    # declared domain are picked up — rather than relying on rdfs:domain alone.
    node_name: dict = {}  # class -> NodeName  (entity classes only)
    node_columns: dict = {}  # class -> [(field, prop), ...]  (uri implied first)
    for cls in entity_classes:
        node_name[cls] = names.unique(_pascal(_local(cls)) + "Node")
        props = list(datatype_props.get(cls, []))
        present = set(props)
        for ind in members[cls]:
            for prop, obj in graph.predicate_objects(ind):
                if prop == RDF.type or prop in present:
                    continue
                if isinstance(obj, rdflib.Literal):
                    present.add(prop)
                    props.append(prop)
        props.sort(key=str)
        cols, seen = [], {"uri"}
        for prop in props:
            field = _safe_var(prop)
            while field in seen:  # disambiguate two props with the same local name
                field += "_"
            seen.add(field)
            cols.append((field, prop))
        node_columns[cls] = cols

    # Class labels (rdfs:label) for the schema layer; the column is only emitted
    # when at least one class carries one.
    class_label: dict = {}
    for cls in classes_sorted:
        class_label[cls] = next(
            (lbl for lbl in graph.objects(cls, RDFS.label)
             if isinstance(lbl, rdflib.Literal)),
            None,
        )
    has_labels = any(v is not None for v in class_label.values())

    n_individuals = len({ind for inds in members.values() for ind in inds})

    # Each predicate (concept + its facts) is one block; blocks are joined with
    # a blank line between them so the generated program stays readable.
    blocks: list[str] = [
        "# Generated by `synalog import` from an OWL/RDF ontology.\n"
        f"# {len(classes_sorted)} classes, {len(object_props)} object properties,"
        f" {n_individuals} individuals."
    ]

    # --- Schema layer: every class as a node -------------------------------
    if classes_sorted:
        fields = "uri:, label:" if has_labels else "uri:"
        block = [
            "# Schema — every class as a node (the TBox)",
            '@OrderBy(ClassNode, "uri");',
            f"ClassNode({fields}) distinct :- ClassRaw({fields});",
        ]
        for cls in classes_sorted:
            values = [f"uri: {_string_literal(str(cls))}"]
            if has_labels:
                lbl = class_label[cls]
                values.append(
                    f"label: {_value_literal(lbl) if lbl is not None else 'null'}"
                )
            block.append(f"ClassRaw({', '.join(values)});")
        blocks.append("\n".join(block))

    # --- Class hierarchy (rdfs:subClassOf), transitive ----------------------
    sub_pairs = sorted(
        (str(c), str(p))
        for c, p in graph.subject_objects(RDFS.subClassOf)
        if named(c) and named(p) and c in class_set and p in class_set
    )
    if sub_pairs:
        block = [
            "# Class hierarchy (transitive subClassOf), joined through ClassNode",
            "@Recursive(SubClassOfEdge, 100);",
            "SubClassOfEdge(child_uri:, parent_uri:) distinct :-"
            " SubClassOfRaw(child_uri:, parent_uri:),"
            " ClassNode(uri: child_uri), ClassNode(uri: parent_uri);",
            "SubClassOfEdge(child_uri:, parent_uri:) distinct :-"
            " SubClassOfEdge(child_uri:, parent_uri: mid),"
            " SubClassOfRaw(child_uri: mid, parent_uri:);",
        ]
        for child, parent in sub_pairs:
            block.append(
                f"SubClassOfRaw(child_uri: {_string_literal(child)},"
                f" parent_uri: {_string_literal(parent)});"
            )
        blocks.append("\n".join(block))

    # --- Instance layer: a node per class that has individuals --------------
    if entity_classes:
        blocks.append("# Concepts (nodes — classes that have individuals)")
    for cls in entity_classes:
        name = node_name[cls]
        cols = node_columns[cls]
        raw = name[:-4] + "Raw" if name.endswith("Node") else name + "Raw"
        fields = ", ".join(["uri:"] + [f"{f}:" for f, _ in cols])
        block = [
            f"@OrderBy({name}, \"uri\");",
            f"{name}({fields}) distinct :- {raw}({fields});",
        ]
        # Facts: one row per individual, datatype values or null.
        for ind in members[cls]:
            values = [f"uri: {_string_literal(str(ind))}"]
            for field, prop in cols:
                obj = next(iter(graph.objects(ind, prop)), None)
                literal = _value_literal(obj) if obj is not None else "null"
                values.append(f"{field}: {literal}")
            block.append(f"{raw}({', '.join(values)});")
        blocks.append("\n".join(block))

    # --- Edges (object properties) between individuals ----------------------
    if object_props:
        blocks.append("# Concepts (edges)")
    for prop, domain, rng in object_props:
        edge = names.unique(_pascal(_local(prop)) + "Edge")
        raw = edge[:-4] + "Raw"
        body = [f"{raw}(subject_uri:, object_uri:)"]
        if domain in node_name:
            body.append(f"{node_name[domain]}(uri: subject_uri)")
        if rng in node_name:
            body.append(f"{node_name[rng]}(uri: object_uri)")
        block = [
            f"@OrderBy({edge}, \"subject_uri\");",
            f"{edge}(subject_uri:, object_uri:) distinct :- " + ", ".join(body) + ";",
        ]
        for s, _, o in sorted(
            graph.triples((None, prop, None)), key=lambda t: (str(t[0]), str(t[2]))
        ):
            if named(s) and named(o):
                block.append(
                    f"{raw}(subject_uri: {_string_literal(str(s))},"
                    f" object_uri: {_string_literal(str(o))});"
                )
        blocks.append("\n".join(block))

    return "\n\n".join(blocks) + "\n"
