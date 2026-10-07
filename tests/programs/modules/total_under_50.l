# The sum of prices under 50, by an imported functor.
# Expect: rows R = [(45,)]
import lib.stats.Total;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 50;
R := Total(Src: Under);
