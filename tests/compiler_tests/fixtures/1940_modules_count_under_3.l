# Test: How many prices are under 3. (from tests/programs/modules/count_under_3.l)

import lib.stats.Count;
import lib.shop.Product;
Under(x: price) :- Product(price:), price < 3;
R := Count(Src: Under);
