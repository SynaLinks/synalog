# Test: The name of b2, through an alias. (from tests/programs/modules/aliased_name_of_b2.l)

import lib.shop.Product as Item;
Q(name:) :- Item(sku: "b2", name:);
