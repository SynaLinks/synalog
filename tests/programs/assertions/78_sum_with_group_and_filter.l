# ∑ with a condition inside the summed relation.
# Expect: holds Big.total
@Assert(Big, total: "Big = ∑ o, Amount o");
Amount(o: 1, a: 50);
Amount(o: 2, a: 70);
Big(t? += a) distinct :- Amount(a:);
