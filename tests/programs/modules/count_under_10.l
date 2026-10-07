# How many prices are under 10.
# Expect: rows R = [(3,)]
import lib.stats.Count;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 10;
R := Count(Src: Under);
