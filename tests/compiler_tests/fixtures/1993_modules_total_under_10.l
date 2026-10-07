# Test: The sum of prices under 10, by an imported functor. (from tests/programs/modules/total_under_10.l)

import lib.stats.Total;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 10;
R := Total(Src: Under);
