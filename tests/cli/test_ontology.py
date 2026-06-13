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
