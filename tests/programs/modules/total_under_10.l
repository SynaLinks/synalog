# The sum of prices under 10, by an imported functor.
# Expect: rows R = [(15,)]
import lib.stats.Total;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 10;
R := Total(Src: Under);
