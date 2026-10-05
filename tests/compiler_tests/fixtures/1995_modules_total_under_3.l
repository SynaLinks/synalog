# Test: The sum of prices under 3, by an imported functor. (from tests/programs/modules/total_under_3.l)

import lib.stats.Total;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 3;
R := Total(Src: Under);
