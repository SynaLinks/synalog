# Test: The largest price under 200. (from tests/programs/modules/largest_under_200.l)

import lib.stats.Largest;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 200;
R := Largest(Src: Under);
