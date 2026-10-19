# The stake an owner holds through a chain of holdings, compounded at each hop,
# round a cycle of holdings: a whole percentage first, then a fraction of it
# (the column widens from an integer), and new rows at every step.
# Expect: rows C = [("a", "b", 1, 50.0), ("b", "c", 1, 40.0), ("c", "a", 1, 10.0), ("a", "c", 2, 20.0), ("b", "a", 2, 4.0), ("c", "b", 2, 5.0), ("a", "a", 3, 2.0), ("b", "b", 3, 2.0), ("c", "c", 3, 2.0), ("a", "b", 4, 1.0), ("b", "c", 4, 0.8), ("c", "a", 4, 0.2), ("a", "c", 5, 0.4), ("b", "a", 5, 0.08), ("c", "b", 5, 0.1)]
Own(owner: "a", owned: "b", percent: 50);
Own(owner: "b", owned: "c", percent: 40);
Own(owner: "c", owned: "a", percent: 10);
@Recursive(C, 4);
@OrderBy(C, "hops", "owner", "entity");
C(owner:, entity: owned, hops: 1, stake: percent) distinct :- Own(owner:, owned:, percent:);
C(owner:, entity: owned, hops: hops + 1, stake: stake * percent / 100) distinct :-
  C(owner:, entity: middle, hops:, stake:),
  Own(owner: middle, owned:, percent:);
