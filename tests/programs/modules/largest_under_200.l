# The largest price under 200.
# Expect: rows R = [(120,)]
import lib.stats.Largest;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 200;
R := Largest(Src: Under);
