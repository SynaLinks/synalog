# Test: One imported generic, two applications. (from tests/programs/modules/functor_two_applications.l)

import lib.stats.Total;
import lib.shop.Product as P;
Mine(x: 4);
Mine(x: 9);
Mine(x: 1);
Prices(x: price) :- P(price:);
A := Total(Src: Mine);
B := Total(Src: Prices);
Q(a:, b:) :- A(t: a), B(t: b);
