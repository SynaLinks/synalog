# Test: A functor over strings. (from tests/programs/functors/12_functor_over_a_table_of_strings.l)

Src(s: "z");
Up(u: Upper(s)) :- Src(s:);
Base(s:) :- s in ["a", "b"];
T0 := Up(Src: Base);
@OrderBy(T, "u");
T(u:) :- T0(u:);
