# The sum of prices under 200, by an imported functor.
# Expect: rows R = [(165,)]
import lib.stats.Total;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 200;
R := Total(Src: Under);
