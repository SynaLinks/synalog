# Imported under another name, a predicate is reported under that name.
# Expect: holds N.positive
# Expect: statement N.positive = ∀ x, N x → x > 0
# Expect: rows N = [(1,), (2,)]
import lib.numbers.Numbers as N;
@Assert(N, positive: "∀ x, N x → x > 0");
Use(x:) :- N(x:);
