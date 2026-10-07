# Rows 1 to 10 ordered by "x desc", "id desc", nulls last.
# Expect: page Q 10 0 = [(10, 'jon', 60, 12.0), (5, 'eve', 60, 10.0), (9, 'ida', 100, 7.75), (3, 'cid', 90, 3.0), (7, 'gus', 88, 2.5), (1, 'ann', 90, 2.5), (4, 'dee', None, 1.25), (6, 'fay', 75, 0.5), (8, 'hal', None, None), (2, 'bob', 75, None)]
V(id: 1, name: "ann", score: 90, x: 2.5, ok: true);
V(id: 2, name: "bob", score: 75, x: null, ok: false);
V(id: 3, name: "cid", score: 90, x: 3.0, ok: true);
V(id: 4, name: "dee", score: null, x: 1.25, ok: false);
V(id: 5, name: "eve", score: 60, x: 10.0, ok: true);
V(id: 6, name: "fay", score: 75, x: 0.5, ok: null);
V(id: 7, name: "gus", score: 88, x: 2.5, ok: false);
V(id: 8, name: "hal", score: null, x: null, ok: true);
V(id: 9, name: "ida", score: 100, x: 7.75, ok: false);
V(id: 10, name: "jon", score: 60, x: 12.0, ok: true);
@OrderBy(Q, "x desc", "id desc");
Q(id:, name:, score:, x:) :- V(id:, name:, score:, x:);
