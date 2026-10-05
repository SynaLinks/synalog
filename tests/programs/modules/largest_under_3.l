# The largest price under 3.
# Expect: rows R = [(2,)]
import lib.stats.Largest;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 3;
R := Largest(Src: Under);
