# How many prices are under 3.
# Expect: rows R = [(1,)]
import lib.stats.Count;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 3;
R := Count(Src: Under);
