# Test: The name of a2, through an alias. (from tests/programs/modules/aliased_name_of_a2.l)

import lib.shop.Product as Item;
Q(name:) :- Item(sku: "a2", name:);
