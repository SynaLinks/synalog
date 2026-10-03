# search over a keyword column.
# Expect: search R ^b = [("b",)]
@OrderBy(R, "group");
R(group:) :- group in ["a", "b"];
