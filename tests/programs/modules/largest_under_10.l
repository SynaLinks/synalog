# The largest price under 10.
# Expect: rows R = [(8,)]
import lib.stats.Largest;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 10;
R := Largest(Src: Under);
