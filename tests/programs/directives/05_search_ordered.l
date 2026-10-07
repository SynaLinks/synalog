# search keeps @OrderBy.
# Expect: search City o = [("oslo",), ("rome",)]
@OrderBy(City, "name");
City(name:) :- name in ["rome", "paris", "oslo"];
