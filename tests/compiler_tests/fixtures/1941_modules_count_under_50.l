# Test: How many prices are under 50. (from tests/programs/modules/count_under_50.l)

import lib.stats.Count;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 50;
R := Count(Src: Under);
