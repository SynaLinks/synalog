# a - b and -b agree.
# Expect: holds Pair.minus
@Assert(Pair, minus: "∀ a b, Pair a b → a - b = a + -b");
Pair(a: 5, b: 3);
Pair(a: -1, b: 4);
