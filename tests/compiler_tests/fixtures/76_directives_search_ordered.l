# Test: search keeps @OrderBy. (from tests/programs/directives/05_search_ordered.l)

@OrderBy(City, "name");
City(name:) :- name in ["rome", "paris", "oslo"];
