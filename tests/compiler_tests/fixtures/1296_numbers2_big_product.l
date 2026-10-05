# Test: A product past 32 bits, made 64-bit with ToInt64. (from tests/programs/numbers2/big_product.l)

Q(v: ToInt64(65536) * 65536 * 3);
