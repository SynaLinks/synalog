# The largest price under 50.
# Expect: rows R = [(30,)]
import lib.stats.Largest;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 50;
R := Largest(Src: Under);
