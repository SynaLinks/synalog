# Test: The name of b1, through an alias. (from tests/programs/modules/aliased_name_of_b1.l)

import lib.shop.Product as Item;
Q(name:) :- Item(sku: "b1", name:);
