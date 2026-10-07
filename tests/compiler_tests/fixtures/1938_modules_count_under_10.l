# Test: How many prices are under 10. (from tests/programs/modules/count_under_10.l)

import lib.stats.Count;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 10;
R := Count(Src: Under);
