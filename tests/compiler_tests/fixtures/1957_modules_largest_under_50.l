# Test: The largest price under 50. (from tests/programs/modules/largest_under_50.l)

import lib.stats.Largest;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 50;
R := Largest(Src: Under);
