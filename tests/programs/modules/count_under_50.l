# How many prices are under 50.
# Expect: rows R = [(4,)]
import lib.stats.Count;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 50;
R := Count(Src: Under);
