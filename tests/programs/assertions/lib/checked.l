# Expect: holds Small.bounded
@Assert(Small, bounded: "∀ x, Small x → x < 3");
Small(x:) :- x in [1, 2];
