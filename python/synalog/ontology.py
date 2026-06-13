# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Convert an OWL/RDF ontology into a Synalog program.

`synalog import ontology.owl` reads an ontology with rdflib (any RDF
serialization: RDF/XML `.owl`, Turtle `.ttl`, `.rdf`, `.n3`, JSON-LD, …) and
prints a Synalog program to stdout, ready to redirect into a `.l` file:

    synalog import ontology.owl > ontology.l

The mapping follows the project's knowledge-graph conventions:

* an OWL/RDFS **class** becomes a concept (named after the class) keyed by the
  individual's URI (preserved verbatim), with one column per **datatype
  property** whose domain is that class;
* an OWL **object property** becomes a concept (named after the property)
  joining two entities through their URIs;
* ``rdfs:subClassOf`` (and ``owl:equivalentClass``, as mutual subclassing)
  becomes a recursive ``SubClassOf`` — the transitive closure of the
  hierarchy;
* **individuals** (the ABox) are emitted as ``*Raw`` facts that the concepts
  build on, so the generated program runs as-is.

**OWL property axioms and characteristics** are translated to the matching
Synalog rule patterns (every generated program is checked by the verifier):

* ``owl:TransitiveProperty`` → a recursive ``@Recursive`` closure of the edge;
* ``owl:SymmetricProperty`` → the reverse direction is unioned in;
* ``owl:inverseOf`` → each property's edge derives the other's inverse;
* ``rdfs:subPropertyOf`` / ``owl:equivalentProperty`` → the super-/equivalent
  property's edge includes the sub-/equivalent one;
* ``owl:ReflexiveProperty`` → ``(x, x)`` for every individual in the domain;
* ``owl:FunctionalProperty`` / ``owl:InverseFunctionalProperty`` /
  ``owl:AsymmetricProperty`` / ``owl:IrreflexiveProperty`` → a
  ``*Violation`` predicate that selects the individuals breaking the constraint
  (these are *checks*: a non-empty result means the data is inconsistent).

Characteristics propagate across ``owl:inverseOf`` and ``owl:equivalentProperty``
(the inverse of a transitive property is transitive, the inverse of a functional
property is inverse-functional, equivalent properties share everything), so the
closures are complete on both sides.

**Class/individual axioms**: ``owl:disjointWith`` → a ``DisjointWithViolation``
predicate (individuals typed by two disjoint classes); ``owl:sameAs`` → a
symmetric+transitive ``SameAs``; ``owl:differentFrom`` → a
``DifferentFromViolation`` (individuals asserted different yet inferred same).

Not translated (they need open-world / non-stratifiable reasoning that does not
map to a finite SQL rule): ``owl:complementOf`` and ``owl:propertyChainAxiom``.

Datatype values keep their natural type (numbers, booleans) where rdflib can
infer it, and strings are emitted as single-quoted literals (Synalog's string
form that tolerates embedded double quotes). A datatype property a given
individual lacks is filled with ``null`` so every row of a concept has the same
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
    from collections import defaultdict
    from rdflib.namespace import OWL, RDF, RDFS

    URIRef = rdflib.URIRef

    def named(term) -> bool:
        return isinstance(term, URIRef)

    def typed(rdf_type) -> set:
        return {s for s in graph.subjects(RDF.type, rdf_type) if named(s)}

    # Classes: explicit owl:Class / rdfs:Class plus anything used as a type.
    classes: set = set()
    classes |= typed(OWL.Class)
    classes |= typed(RDFS.Class)

    datatype_prop_set = typed(OWL.DatatypeProperty)

    # Datatype properties grouped by their domain class; object properties with
    # their (optional) domain and range.
    datatype_props: dict = {}  # class -> [prop, ...]
    for prop in datatype_prop_set:
        for domain in graph.objects(prop, RDFS.domain):
            if named(domain):
                classes.add(domain)
                datatype_props.setdefault(domain, [])
                if prop not in datatype_props[domain]:
                    datatype_props[domain].append(prop)

    obj_domain: dict = {}
    obj_range: dict = {}
    obj_props: set = set()
    for prop in typed(OWL.ObjectProperty):
        obj_props.add(prop)
        obj_domain[prop] = next(
            (d for d in graph.objects(prop, RDFS.domain) if named(d)), None
        )
        obj_range[prop] = next(
            (r for r in graph.objects(prop, RDFS.range) if named(r)), None
        )

    # --- OWL property characteristics --------------------------------------
    transitive = typed(OWL.TransitiveProperty)
    symmetric = typed(OWL.SymmetricProperty)
    asymmetric = typed(OWL.AsymmetricProperty)
    reflexive = typed(OWL.ReflexiveProperty)
    irreflexive = typed(OWL.IrreflexiveProperty)
    functional = typed(OWL.FunctionalProperty)
    inverse_functional = typed(OWL.InverseFunctionalProperty)

    inverse_of: dict = defaultdict(set)
    for a, b in graph.subject_objects(OWL.inverseOf):
        if named(a) and named(b):
            inverse_of[a].add(b)
            inverse_of[b].add(a)

    equiv_props: dict = defaultdict(set)
    for a, b in graph.subject_objects(OWL.equivalentProperty):
        if named(a) and named(b) and a != b:
            equiv_props[a].add(b)
            equiv_props[b].add(a)

    sub_props: dict = defaultdict(set)  # super -> {sub, ...}
    for sub, sup in graph.subject_objects(RDFS.subPropertyOf):
        if named(sub) and named(sup):
            sub_props[sup].add(sub)

    def has_named_object(prop) -> bool:
        return any(named(o) for _, _, o in graph.triples((None, prop, None)))

    # A property is treated as an object property if it is declared one, takes
    # part in an object-only axiom (inverseOf), or simply relates named
    # resources. Datatype properties (literal-valued) are never turned into edges.
    candidates = (
        transitive | symmetric | asymmetric | reflexive | irreflexive
        | functional | inverse_functional
    )
    for m in (inverse_of, equiv_props, sub_props):
        for k, vs in m.items():
            candidates.add(k)
            candidates.update(vs)
    # inverseOf participants are object properties by definition.
    for k, vs in inverse_of.items():
        obj_props.add(k)
        obj_props.update(vs)
    for prop in candidates:
        if prop in obj_props or prop in datatype_prop_set:
            continue
        if has_named_object(prop):
            obj_props.add(prop)
    for prop in obj_props:
        obj_domain.setdefault(prop, None)
        obj_range.setdefault(prop, None)
        if obj_domain[prop]:
            classes.add(obj_domain[prop])
        if obj_range[prop]:
            classes.add(obj_range[prop])

    # Restrict characteristic sets to actual object properties.
    transitive &= obj_props
    symmetric &= obj_props
    asymmetric &= obj_props
    reflexive &= obj_props
    irreflexive &= obj_props
    functional &= obj_props
    inverse_functional &= obj_props

    # Propagate characteristics across owl:inverseOf and owl:equivalentProperty
    # to a fixpoint (inverse of transitive is transitive; inverse of functional
    # is inverse-functional; equivalent properties share everything).
    symmetric_sets = (
        transitive, symmetric, reflexive, irreflexive, asymmetric,
        functional, inverse_functional,
    )
    changed = True
    while changed:
        changed = False
        for p in list(obj_props):
            for q in equiv_props.get(p, ()):  # equivalence shares all
                if q not in obj_props:
                    continue
                for s in symmetric_sets:
                    if p in s and q not in s:
                        s.add(q)
                        changed = True
            for q in inverse_of.get(p, ()):
                if q not in obj_props:
                    continue
                for s in (transitive, symmetric, reflexive, irreflexive, asymmetric):
                    if p in s and q not in s:
                        s.add(q)
                        changed = True
                if p in functional and q not in inverse_functional:
                    inverse_functional.add(q)
                    changed = True
                if p in inverse_functional and q not in functional:
                    functional.add(q)
                    changed = True

    # Stable ordering everywhere so output is deterministic.
    classes_sorted = sorted(classes, key=str)
    for key in datatype_props:
        datatype_props[key].sort(key=str)
    obj_props_sorted = sorted(obj_props, key=str)
    class_set = set(classes_sorted)

    has_facts = {
        p: any(named(s) and named(o) for s, _, o in graph.triples((None, p, None)))
        for p in obj_props
    }

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
    #   * the SCHEMA layer is always emitted — every class is a row of `Class`
    #     and the `rdfs:subClassOf` hierarchy is a recursive `SubClassOf`;
    #   * the INSTANCE layer adds a per-class concept (+ facts) only for classes
    #     that actually have individuals, so classes-as-entities don't spam the
    #     output with thousands of empty one-row predicates.
    entity_classes = [cls for cls in classes_sorted if members[cls]]

    # Reserve the fixed schema predicate names so a class literally named
    # "Class" (or a "SubClassOf" property) gets a suffixed entity-node name.
    names = _Names()
    names.unique("Class")
    names.unique("SubClassOf")

    # A node's columns are data-driven: the datatype properties declared for the
    # class PLUS any literal-valued property its individuals actually use. The
    # data-driven part is what makes inheritance work — an individual typed as a
    # subclass still gets the (super)class's properties, and properties with no
    # declared domain are picked up — rather than relying on rdfs:domain alone.
    node_name: dict = {}  # class -> concept name  (entity classes only)
    node_columns: dict = {}  # class -> [(field, prop), ...]  (uri implied first)
    for cls in entity_classes:
        node_name[cls] = names.unique(_pascal(_local(cls)))
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

    # Deterministic predicate names for every object property, assigned up front
    # so rules can cross-reference each other's edge/raw predicates.
    edge_name: dict = {}
    raw_name: dict = {}
    step_name: dict = {}
    for prop in obj_props_sorted:
        e = names.unique(_pascal(_local(prop)))
        edge_name[prop] = e
        raw_name[prop] = e + "Raw"
        step_name[prop] = e + "Step"

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
        f"# {len(classes_sorted)} classes, {len(obj_props_sorted)} object properties,"
        f" {n_individuals} individuals."
    ]

    # --- Schema layer: every class as a concept ----------------------------
    if classes_sorted:
        fields = "uri:, label:" if has_labels else "uri:"
        block = [
            "# Schema — every class as a concept (the TBox)",
            '@OrderBy(Class, "uri");',
            f"Class({fields}) distinct :- ClassRaw({fields});",
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

    # --- Class hierarchy: subClassOf (+ equivalentClass), transitive --------
    sub_pairs = {
        (str(c), str(p))
        for c, p in graph.subject_objects(RDFS.subClassOf)
        if named(c) and named(p) and c in class_set and p in class_set
    }
    # owl:equivalentClass C ≡ D  ==  C ⊑ D and D ⊑ C (mutual subclassing).
    for c, d in graph.subject_objects(OWL.equivalentClass):
        if named(c) and named(d) and c in class_set and d in class_set and c != d:
            sub_pairs.add((str(c), str(d)))
            sub_pairs.add((str(d), str(c)))
    if sub_pairs:
        block = [
            "# Class hierarchy (transitive subClassOf / equivalentClass),"
            " joined through Class",
            "@Recursive(SubClassOf, 100);",
            "SubClassOf(child_uri:, parent_uri:) distinct :-"
            " SubClassOfRaw(child_uri:, parent_uri:),"
            " Class(uri: child_uri), Class(uri: parent_uri);",
            "SubClassOf(child_uri:, parent_uri:) distinct :-"
            " SubClassOf(child_uri:, parent_uri: mid),"
            " SubClassOfRaw(child_uri: mid, parent_uri:);",
        ]
        for child, parent in sorted(sub_pairs):
            block.append(
                f"SubClassOfRaw(child_uri: {_string_literal(child)},"
                f" parent_uri: {_string_literal(parent)});"
            )
        blocks.append("\n".join(block))

    # --- Instance layer: a concept per class that has individuals ----------
    if entity_classes:
        blocks.append("# Concepts — classes that have individuals")
    for cls in entity_classes:
        name = node_name[cls]
        cols = node_columns[cls]
        raw = name + "Raw"
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

    # --- Object properties (relationships) between individuals --------------
    if obj_props_sorted:
        blocks.append("# Concepts — object properties (relationships)")
    for prop in obj_props_sorted:
        edge = edge_name[prop]
        raw = raw_name[prop]
        step = step_name[prop]
        dom, rng = obj_domain.get(prop), obj_range.get(prop)
        joins = []
        if dom in node_name:
            joins.append(f"{node_name[dom]}(uri: subject_uri)")
        if rng in node_name:
            joins.append(f"{node_name[rng]}(uri: object_uri)")
        join_suffix = ("".join(", " + j for j in joins))

        # One-step (non-recursive) branches that make up the edge relation.
        branches: list[str] = []
        if has_facts[prop]:
            branches.append(f"{raw}(subject_uri:, object_uri:)" + join_suffix)
        if prop in symmetric and has_facts[prop]:
            branches.append(
                f"{raw}(subject_uri: object_uri, object_uri: subject_uri)" + join_suffix
            )
        for q in sorted(inverse_of.get(prop, ()), key=str):
            if q in obj_props and has_facts[q]:  # inverse of q's asserted facts
                branches.append(
                    f"{raw_name[q]}(subject_uri: object_uri, object_uri: subject_uri)"
                    + join_suffix
                )
        for sub in sorted(sub_props.get(prop, ()), key=str):
            if sub in obj_props and has_facts[sub]:  # sub-property's facts flow up
                branches.append(
                    f"{raw_name[sub]}(subject_uri:, object_uri:)" + join_suffix
                )
        for q in sorted(equiv_props.get(prop, ()), key=str):
            if q in obj_props and has_facts[q]:
                branches.append(
                    f"{raw_name[q]}(subject_uri:, object_uri:)" + join_suffix
                )
        if prop in reflexive and dom in node_name:  # (x, x) over the domain
            branches.append(
                f"{node_name[dom]}(uri: subject_uri), object_uri == subject_uri"
            )

        if not branches:
            continue  # property with no facts and nothing to derive

        block: list[str] = []
        if prop in transitive:
            # One-step relation, then its recursive transitive closure.
            block.append(f"@OrderBy({step}, \"subject_uri\");")
            block.append(
                f"{step}(subject_uri:, object_uri:) distinct :-\n  "
                + " |\n  ".join(branches)
                + ";"
            )
            block.append(f"@OrderBy({edge}, \"subject_uri\");")
            block.append(f"@Recursive({edge}, 100);")
            block.append(
                f"{edge}(subject_uri:, object_uri:) distinct :-"
                f" {step}(subject_uri:, object_uri:);"
            )
            block.append(
                f"{edge}(subject_uri:, object_uri:) distinct :-"
                f" {edge}(subject_uri:, object_uri: mid),"
                f" {step}(subject_uri: mid, object_uri:);"
            )
        else:
            block.append(f"@OrderBy({edge}, \"subject_uri\");")
            if len(branches) == 1:
                block.append(
                    f"{edge}(subject_uri:, object_uri:) distinct :- {branches[0]};"
                )
            else:
                block.append(
                    f"{edge}(subject_uri:, object_uri:) distinct :-\n  "
                    + " |\n  ".join(branches)
                    + ";"
                )

        # Raw facts for this property.
        for s, _, o in sorted(
            graph.triples((None, prop, None)), key=lambda t: (str(t[0]), str(t[2]))
        ):
            if named(s) and named(o):
                block.append(
                    f"{raw}(subject_uri: {_string_literal(str(s))},"
                    f" object_uri: {_string_literal(str(o))});"
                )

        # --- Constraint checks (a non-empty result = inconsistent data) -----
        prefix = edge  # the property's concept name
        if prop in functional:
            v = names.unique(prefix + "FunctionalViolation")
            block += [
                f"@OrderBy({v}, \"subject_uri\");",
                f"{v}(subject_uri:) distinct :-"
                f" {edge}(subject_uri:, object_uri: value_a),"
                f" {edge}(subject_uri:, object_uri: value_b), value_a != value_b;",
            ]
        if prop in inverse_functional:
            v = names.unique(prefix + "InverseFunctionalViolation")
            block += [
                f"@OrderBy({v}, \"object_uri\");",
                f"{v}(object_uri:) distinct :-"
                f" {edge}(subject_uri: subject_a, object_uri:),"
                f" {edge}(subject_uri: subject_b, object_uri:), subject_a != subject_b;",
            ]
        if prop in asymmetric:
            v = names.unique(prefix + "AsymmetricViolation")
            block += [
                f"@OrderBy({v}, \"subject_uri\");",
                f"{v}(subject_uri:, object_uri:) distinct :-"
                f" {edge}(subject_uri:, object_uri:),"
                f" {edge}(subject_uri: object_uri, object_uri: subject_uri);",
            ]
        if prop in irreflexive:
            v = names.unique(prefix + "IrreflexiveViolation")
            block += [
                f"@OrderBy({v}, \"uri\");",
                f"{v}(uri:) distinct :- {edge}(subject_uri: uri, object_uri: uri);",
            ]

        blocks.append("\n".join(block))

    # --- owl:sameAs (symmetric + transitive individual equivalence) ---------
    sameas_pairs = sorted(
        (str(a), str(b))
        for a, b in graph.subject_objects(OWL.sameAs)
        if named(a) and named(b) and a != b
    )
    if sameas_pairs:
        same = names.unique("SameAs")
        block = [
            "# owl:sameAs — symmetric, transitive individual equivalence",
            f"@OrderBy({same}, \"left_uri\");",
            f"@Recursive({same}, 100);",
            f"{same}(left_uri:, right_uri:) distinct :-\n"
            "  SameAsRaw(left_uri:, right_uri:) |\n"
            "  SameAsRaw(left_uri: right_uri, right_uri: left_uri);",
            f"{same}(left_uri:, right_uri:) distinct :-"
            f" {same}(left_uri:, right_uri: mid),"
            f" {same}(left_uri: mid, right_uri:);",
        ]
        for a, b in sameas_pairs:
            block.append(
                f"SameAsRaw(left_uri: {_string_literal(a)},"
                f" right_uri: {_string_literal(b)});"
            )
        # owl:differentFrom — asserted different yet inferred same = violation.
        diff_pairs = sorted(
            (str(a), str(b))
            for a, b in graph.subject_objects(OWL.differentFrom)
            if named(a) and named(b) and a != b
        )
        if diff_pairs:
            viol = names.unique("DifferentFromViolation")
            block += [
                f"@OrderBy({viol}, \"left_uri\");",
                f"{viol}(left_uri:, right_uri:) distinct :-"
                f" {same}(left_uri:, right_uri:),"
                " DifferentFromRaw(left_uri:, right_uri:);",
            ]
            for a, b in diff_pairs:
                block.append(
                    f"DifferentFromRaw(left_uri: {_string_literal(a)},"
                    f" right_uri: {_string_literal(b)});"
                )
        blocks.append("\n".join(block))

    # --- owl:disjointWith (individuals typed by two disjoint classes) -------
    disjoint_pairs = sorted(
        {
            tuple(sorted((str(c), str(d))))
            for c, d in graph.subject_objects(OWL.disjointWith)
            if named(c) and named(d) and c in class_set and d in class_set and c != d
        }
    )
    uri_to_class = {str(c): c for c in classes_sorted}
    detectable = [
        (a, b)
        for a, b in disjoint_pairs
        if uri_to_class.get(a) in node_name and uri_to_class.get(b) in node_name
    ]
    if detectable:
        bodies = []
        for a, b in detectable:
            na = node_name[uri_to_class[a]]
            nb = node_name[uri_to_class[b]]
            bodies.append(
                f"{na}(uri:), {nb}(uri:),"
                f" class_a == {_string_literal(a)}, class_b == {_string_literal(b)}"
            )
        block = [
            "# owl:disjointWith — an individual typed by two disjoint classes",
            '@OrderBy(DisjointWithViolation, "uri");',
            "DisjointWithViolation(uri:, class_a:, class_b:) distinct :-\n  "
            + " |\n  ".join(bodies)
            + ";",
        ]
        blocks.append("\n".join(block))

    return "\n\n".join(blocks) + "\n"
