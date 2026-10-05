# The full reachability is not within the short roads' one.
# Expect: counterexamples Reach.functor_reach_superset_violated = [('a', 'e'), ('b', 'e'), ('c', 'e'), ('d', 'e')]
Road(src: "a", dst: "b", km: 4);
Road(src: "b", dst: "c", km: 3);
Road(src: "a", dst: "c", km: 9);
Road(src: "c", dst: "d", km: 2);
Road(src: "b", dst: "d", km: 8);
Road(src: "d", dst: "e", km: 5);
City(name: "a", region: "north", pop: 120);
City(name: "b", region: "north", pop: 80);
City(name: "c", region: "south", pop: 45);
City(name: "d", region: "south", pop: 30);
City(name: "e", region: "east", pop: 15);
Km(src:, dst:, km:) :- Road(src:, dst:, km:);
Pop(name:, pop:) :- City(name:, pop:);
Trip(id: 1, src: "a", dst: "d", km: 9);
Trip(id: 2, src: "b", dst: "e", km: 15);
Trip(id: 3, src: "a", dst: "e", km: 13);
@Recursive(Reach, 6);
Reach(src:, dst:) distinct :- Road(src:, dst:);
Reach(src:, dst: c) distinct :- Reach(src:, dst:), Road(src: dst, dst: c);
Edges(src: "", dst: "");
@Recursive(Walk, 6);
Walk(src:, dst:) distinct :- Edges(src:, dst:);
Walk(src:, dst: c) distinct :- Walk(src:, dst:), Edges(src: dst, dst: c);
Short(src:, dst:) :- Road(src:, dst:, km:), km < 5;
Small := Walk(Edges: Short);
@Assert(Reach, functor_reach_superset_violated: "∀ a b, Reach a b → Small a b");
