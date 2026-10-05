# Test: The sum of prices under 200, by an imported functor. (from tests/programs/modules/total_under_200.l)

import lib.stats.Total;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 200;
R := Total(Src: Under);
