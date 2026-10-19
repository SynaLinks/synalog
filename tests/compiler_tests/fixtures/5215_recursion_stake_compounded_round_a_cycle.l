# Test: The stake an owner holds through a chain of holdings, compounded at each hop, round a cycle of holdings: a whole percentage first, then a fraction of it (the column widens from an integer), and new rows at every step. (from tests/programs/recursion/55_stake_compounded_round_a_cycle.l)

Own(owner: "a", owned: "b", percent: 50);
Own(owner: "b", owned: "c", percent: 40);
Own(owner: "c", owned: "a", percent: 10);
@Recursive(C, 4);
@OrderBy(C, "hops", "owner", "entity");
C(owner:, entity: owned, hops: 1, stake: percent) distinct :- Own(owner:, owned:, percent:);
C(owner:, entity: owned, hops: hops + 1, stake: stake * percent / 100) distinct :-
  C(owner:, entity: middle, hops:, stake:),
  Own(owner: middle, owned:, percent:);
