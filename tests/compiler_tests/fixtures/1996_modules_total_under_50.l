# Test: The sum of prices under 50, by an imported functor. (from tests/programs/modules/total_under_50.l)

import lib.stats.Total;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 50;
R := Total(Src: Under);
