# Test: Ifnull agrees with Coalesce. (from tests/programs/funcs/ifnull_with_coalesce.l)

Q(ok: 1) :- Ifnull(null, 5) == Coalesce(null, 5);
