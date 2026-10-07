# Test: The name of c1, through an alias. (from tests/programs/modules/aliased_name_of_c1.l)

import lib.shop.Product as Item;
Q(name:) :- Item(sku: "c1", name:);
