# Test: Math functions (Exp, Log, Sin, Cos, Pow)

Numbers(x: 1);
Numbers(x: 2);
Numbers(x: 3);

@OrderBy(Computed, "x");
Computed(x:,
         e: Exp(ToFloat64(x)),
         l: Log(ToFloat64(x)),
         s: Sin(ToFloat64(x)),
         c: Cos(ToFloat64(x)),
         p: Pow(x, 2)) :- Numbers(x:);

@OrderBy(Test, "x");
Test(x:, e:, l:, s:, c:, p:) :- Computed(x:, e:, l:, s:, c:, p:);
