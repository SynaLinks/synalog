# The sum of prices under 3, by an imported functor.
# Expect: rows R = [(2,)]
import lib.stats.Total;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 3;
R := Total(Src: Under);
