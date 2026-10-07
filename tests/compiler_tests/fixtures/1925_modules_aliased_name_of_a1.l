# Test: The name of a1, through an alias. (from tests/programs/modules/aliased_name_of_a1.l)

import lib.shop.Product as Item;
Q(name:) :- Item(sku: "a1", name:);
