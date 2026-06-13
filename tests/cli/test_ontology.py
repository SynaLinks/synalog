"""Unit tests for synalog.ontology: OWL/RDF -> Synalog conversion.

The conversion is exercised against small inline ontologies (Turtle) parsed by
rdflib in-process; no network access. The generated programs are round-tripped
through the real compiler to prove they are valid, runnable Synalog.

Run with: python -m pytest tests/cli/test_ontology.py
"""

from __future__ import annotations

import pytest

from synalog import ontology
from synalog._synalog import check

ONTOLOGY = """\
@prefix : <http://ex.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

:Person a owl:Class .
:Employee a owl:Class ; rdfs:subClassOf :Person .
:Company a owl:Class .

:name a owl:DatatypeProperty ; rdfs:domain :Person .
:age  a owl:DatatypeProperty ; rdfs:domain :Person .
:worksAt a owl:ObjectProperty ; rdfs:domain :Employee ; rdfs:range :Company .

:alice a :Employee ; :name "Alice O'Brien" ; :age 30 ; :worksAt :acme .
:bob a :Person ; :name "Bob" .
:acme a :Company ; :name "Acme \\"Inc\\"" .
"""


def convert(text: str) -> str:
    import rdflib

    g = rdflib.Graph()
    g.parse(data=text, format="turtle")
    return ontology.convert_graph(g)


@pytest.fixture
def program() -> str:
    return convert(ONTOLOGY)


def test_output_is_valid_synalog(program):
    assert check(program) == []


def test_classes_become_node_concepts(program):
    assert "PersonNode(" in program
    assert "EmployeeNode(" in program
    assert "CompanyNode(" in program


def test_datatype_properties_become_columns(program):
    # Person carries its datatype properties as columns, sorted by local name.
    assert "PersonNode(uri:, age:, name:) distinct :- PersonRaw(uri:, age:, name:);" in program


def test_object_property_becomes_edge_joining_nodes(program):
    # worksAt joins an Employee to a Company through their node concepts.
    assert "WorksAtEdge(subject_uri:, object_uri:) distinct :-" in program
    assert "EmployeeNode(uri: subject_uri)" in program
    assert "CompanyNode(uri: object_uri)" in program


def test_individuals_emitted_as_facts(program):
    # URIs preserved verbatim; numbers stay numeric; a missing property is null.
    assert "uri: 'http://ex.org/alice'" in program
    assert "age: 30" in program
    assert "name: 'Bob'" in program
    assert "age: null" in program  # bob has no age
    assert "WorksAtRaw(subject_uri: 'http://ex.org/alice', object_uri: 'http://ex.org/acme');" in program


def test_string_values_with_quotes_are_safe(program):
    # Single-quoted literals tolerate embedded double quotes (Acme "Inc").
    assert "name: 'Acme \"Inc\"'" in program
    # Embedded single quote (O'Brien) is escaped.
    assert "Alice O\\'Brien" in program


def test_subclass_hierarchy_is_recursive(program):
    assert "@Recursive(SubClassOfEdge, 100);" in program
    assert (
        "SubClassOfRaw(child_uri: 'http://ex.org/Employee',"
        " parent_uri: 'http://ex.org/Person');" in program
    )


def test_predicate_name_collision_is_suffixed():
    # Two classes with the same local name in different namespaces, each with an
    # individual (so each gets an entity node), must not clash.
    text = """\
@prefix a: <http://a.org/> .
@prefix b: <http://b.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
a:Thing a owl:Class .
b:Thing a owl:Class .
a:x a a:Thing .
b:y a b:Thing .
"""
    program = convert(text)
    assert "ThingNode(" in program
    assert "ThingNode2(" in program
    assert check(program) == []


def test_schema_layer_lists_every_class_as_classnode(program):
    # The schema (TBox) layer is always emitted: every class is a ClassNode row.
    assert 'ClassNode(uri:, label:) distinct :- ClassRaw(uri:, label:);' not in program  # no labels here
    assert "ClassNode(uri:) distinct :- ClassRaw(uri:);" in program
    for cls in ("Person", "Employee", "Company"):
        assert f"ClassRaw(uri: 'http://ex.org/{cls}');" in program


def test_class_only_ontology_emits_schema_not_empty_entity_nodes():
    # A taxonomy (classes + subClassOf, no individuals — like an OBO ontology)
    # produces a ClassNode graph and the hierarchy, and NO per-class entity
    # nodes (which would otherwise be thousands of empty one-row predicates).
    text = """\
@prefix : <http://ex.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
:Animal a owl:Class ; rdfs:label "animal" .
:Dog a owl:Class ; rdfs:label "dog" ; rdfs:subClassOf :Animal .
"""
    program = convert(text)
    assert "ClassNode(uri:, label:) distinct :- ClassRaw(uri:, label:);" in program
    assert "ClassRaw(uri: 'http://ex.org/Dog', label: 'dog');" in program
    assert "@Recursive(SubClassOfEdge, 100);" in program
    assert "AnimalNode(" not in program and "DogNode(" not in program  # no entity nodes
    assert check(program) == []


def test_labels_become_classnode_column_when_present():
    text = """\
@prefix : <http://ex.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
:Gene a owl:Class ; rdfs:label "gene" .
"""
    program = convert(text)
    assert "label: 'gene'" in program


def test_empty_ontology_is_valid():
    program = convert("@prefix owl: <http://www.w3.org/2002/07/owl#> .\n")
    assert check(program) == []


def test_is_url():
    assert ontology.is_url("http://ex.org/o.owl")
    assert ontology.is_url("https://ex.org/o.owl")
    assert ontology.is_url("FTP://ex.org/o.owl")
    assert not ontology.is_url("/local/path/o.owl")
    assert not ontology.is_url("o.owl")


# ---------------------------------------------------------------------------
# OWL property characteristics and axioms
# ---------------------------------------------------------------------------

# One ontology exercising every translated OWL construct. The generated program
# must compile (asserted once below); individual tests pin the rule shapes.
OWL_AXIOMS = """\
@prefix : <http://ex.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

:Person a owl:Class .
:Org a owl:Class .
:Animal a owl:Class .
:Cat a owl:Class ; rdfs:subClassOf :Animal .
:Dog a owl:Class ; rdfs:subClassOf :Animal .
:Cat owl:disjointWith :Dog .
:Human a owl:Class ; owl:equivalentClass :Person .

:ancestorOf a owl:ObjectProperty, owl:TransitiveProperty ; rdfs:domain :Person ; rdfs:range :Person .
:knows a owl:ObjectProperty, owl:SymmetricProperty ; rdfs:domain :Person ; rdfs:range :Person .
:worksAt a owl:ObjectProperty ; rdfs:domain :Person ; rdfs:range :Org .
:employs a owl:ObjectProperty ; owl:inverseOf :worksAt .
:parentOf a owl:ObjectProperty ; rdfs:domain :Person ; rdfs:range :Person .
:fatherOf a owl:ObjectProperty ; rdfs:subPropertyOf :parentOf .
:hasId a owl:ObjectProperty, owl:FunctionalProperty, owl:InverseFunctionalProperty ; rdfs:domain :Person ; rdfs:range :Org .
:taller a owl:ObjectProperty, owl:AsymmetricProperty, owl:IrreflexiveProperty ; rdfs:domain :Person ; rdfs:range :Person .
:related a owl:ObjectProperty, owl:ReflexiveProperty ; rdfs:domain :Person ; rdfs:range :Person .

:alice a :Person . :bob a :Person . :carol a :Person .
:acme a :Org . :acme2 a :Org .
:fluffy a :Cat . :rex a :Dog .
:alice :ancestorOf :bob . :bob :ancestorOf :carol .
:alice :knows :bob .
:alice :worksAt :acme .
:alice :fatherOf :bob .
:alice :hasId :acme . :alice :hasId :acme2 .
:alice :taller :bob .
:alice owl:sameAs :alice2 .
:alice owl:differentFrom :bob .
"""


@pytest.fixture
def axioms() -> str:
    return convert(OWL_AXIOMS)


def _run(program: str, predicate: str):
    """Compile `predicate` to SQLite and execute it, returning the local names
    of each row's URIs so transitive/symmetric/etc. semantics can be asserted."""
    from synalog._synalog import compile as compile_one
    from synalog.runners import _run_sqlite

    sql = compile_one(program, predicate, None, None, "sqlite", None)
    _cols, rows = _run_sqlite(sql, [])
    return sorted(tuple(str(c).rsplit("/", 1)[-1] for c in r) for r in rows)


def test_owl_axioms_program_is_valid(axioms):
    assert check(axioms) == []


def test_transitive_property_is_recursive_closure(axioms):
    assert "@Recursive(AncestorOfEdge, 100);" in axioms
    # alice->bob->carol entails alice->carol.
    assert ("alice", "carol") in _run(axioms, "AncestorOfEdge")


def test_symmetric_property_adds_reverse(axioms):
    assert "KnowsRaw(subject_uri: object_uri, object_uri: subject_uri)" in axioms
    knows = _run(axioms, "KnowsEdge")
    assert ("alice", "bob") in knows and ("bob", "alice") in knows


def test_inverse_property_derives_opposite_direction(axioms):
    # employs is the inverse of the asserted worksAt facts.
    assert ("acme", "alice") in _run(axioms, "EmploysEdge")


def test_subproperty_facts_flow_into_superproperty(axioms):
    # fatherOf ⊑ parentOf, so alice fatherOf bob entails alice parentOf bob.
    assert ("alice", "bob") in _run(axioms, "ParentOfEdge")


def test_functional_property_violation_detects_two_values(axioms):
    # alice has two hasId values -> functional constraint violated.
    assert "HasIdFunctionalViolation(subject_uri:) distinct :-" in axioms
    assert ("alice",) in _run(axioms, "HasIdFunctionalViolation")


def test_inverse_functional_violation_predicate_emitted(axioms):
    assert "HasIdInverseFunctionalViolation(object_uri:) distinct :-" in axioms


def test_asymmetric_and_irreflexive_violations_emitted(axioms):
    assert "TallerAsymmetricViolation(subject_uri:, object_uri:) distinct :-" in axioms
    assert "TallerIrreflexiveViolation(uri:) distinct :-" in axioms


def test_reflexive_property_adds_self_loops(axioms):
    assert "object_uri == subject_uri" in axioms
    related = _run(axioms, "RelatedEdge")
    assert ("alice", "alice") in related and ("bob", "bob") in related


def test_equivalent_class_becomes_mutual_subclass(axioms):
    assert (
        "SubClassOfRaw(child_uri: 'http://ex.org/Human',"
        " parent_uri: 'http://ex.org/Person');" in axioms
    )
    assert (
        "SubClassOfRaw(child_uri: 'http://ex.org/Person',"
        " parent_uri: 'http://ex.org/Human');" in axioms
    )


def test_same_as_is_symmetric_transitive_closure(axioms):
    assert "@Recursive(SameAsEdge, 100);" in axioms
    same = _run(axioms, "SameAsEdge")
    assert ("alice", "alice2") in same and ("alice2", "alice") in same


def test_different_from_violation_predicate_emitted(axioms):
    assert "DifferentFromViolation(left_uri:, right_uri:) distinct :-" in axioms


def test_disjoint_with_violation_predicate_emitted(axioms):
    assert "DisjointWithViolation(uri:, class_a:, class_b:) distinct :-" in axioms


def test_inverse_of_transitive_is_inferred_transitive():
    # The inverse of a transitive property is transitive: `descendantOf` is never
    # declared transitive, but inverseOf :ancestorOf (which is) must close it.
    text = """\
@prefix : <http://ex.org/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
:Person a owl:Class .
:ancestorOf a owl:ObjectProperty, owl:TransitiveProperty ;
            rdfs:domain :Person ; rdfs:range :Person .
:descendantOf a owl:ObjectProperty ; owl:inverseOf :ancestorOf .
:a a :Person . :b a :Person . :c a :Person .
:a :ancestorOf :b . :b :ancestorOf :c .
"""
    program = convert(text)
    assert check(program) == []
    assert "@Recursive(DescendantOfEdge, 100);" in program
    # c descendantOf a is only reachable if the inverse is transitively closed.
    assert ("c", "a") in _run(program, "DescendantOfEdge")


def test_plain_object_property_output_is_unchanged(axioms):
    # A property with no characteristics keeps the simple single-line edge form.
    assert (
        "WorksAtEdge(subject_uri:, object_uri:) distinct :-"
        " WorksAtRaw(subject_uri:, object_uri:),"
        " PersonNode(uri: subject_uri), OrgNode(uri: object_uri);" in axioms
    )
