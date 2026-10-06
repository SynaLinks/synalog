# Test: A fact whose only list is empty. (from tests/programs/lists3/empty_list_in_a_fact_alone.l)

F(l: []);
Q(n: Size(l)) :- F(l:);
