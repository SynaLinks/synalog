# Test: How many prices are under 200. (from tests/programs/modules/count_under_200.l)

import lib.stats.Count;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 200;
R := Count(Src: Under);
