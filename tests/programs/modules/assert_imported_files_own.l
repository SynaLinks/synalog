# The imported file's own assertion is checked.
# Expect: holds Price.positive
import lib.shop.Price;
Use(sku:) :- Price(sku:);
