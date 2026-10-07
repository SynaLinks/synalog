# Total stock value, aggregated from an import.
# Expect: rows Q = [(490,)]
import lib.shop.Value;
Q(t? += value) distinct :- Value(value:);
