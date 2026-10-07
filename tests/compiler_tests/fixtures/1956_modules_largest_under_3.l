# Test: The largest price under 3. (from tests/programs/modules/largest_under_3.l)

import lib.stats.Largest;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 3;
R := Largest(Src: Under);
