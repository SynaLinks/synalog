# A functor over strings.
# Expect: rows T = [("A",), ("B",)]
Src(s: "z");
Up(u: Upper(s)) :- Src(s:);
Base(s:) :- s in ["a", "b"];
T0 := Up(Src: Base);
@OrderBy(T, "u");
T(u:) :- T0(u:);
