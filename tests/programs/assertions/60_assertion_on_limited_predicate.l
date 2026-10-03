# @Limit is part of what a predicate holds, also for the rules that use it:
# the assertion is about the rows Top has.
# Expect: rows Top = [(1,)]
# Expect: holds Top.small
@Assert(Top, small: "∀ x, Top x → x < 3");
V(x:) :- x in [1, 2, 3];
@OrderBy(Top, "x");
@Limit(Top, 1);
Top(x:) :- V(x:);
