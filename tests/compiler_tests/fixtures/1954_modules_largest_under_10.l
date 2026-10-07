# Test: The largest price under 10. (from tests/programs/modules/largest_under_10.l)

import lib.stats.Largest;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 10;
R := Largest(Src: Under);
