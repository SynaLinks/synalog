# How many prices are under 200.
# Expect: rows R = [(5,)]
import lib.stats.Count;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 200;
R := Count(Src: Under);
