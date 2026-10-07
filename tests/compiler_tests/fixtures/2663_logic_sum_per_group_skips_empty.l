# Test: Groups exist only where rows do. (from tests/programs/logic/sum_per_group_skips_empty.l)

Person(id: 1, name: "Ann", team: "red", age: 34, active: true);
Person(id: 2, name: "Bob", team: "red", age: null, active: false);
Person(id: 3, name: "Cid", team: "blue", age: 52, active: true);
Person(id: 4, name: "Dee", team: "blue", age: 23, active: false);
Person(id: 5, name: "Eve", team: "green", age: 41, active: null);
Person(id: 6, name: "Fay", team: "red", age: 19, active: true);
Person(id: 7, name: "Gus", team: "gold", age: 60, active: false);
Proj(pid: 10, team: "red", budget: 300);
Proj(pid: 11, team: "red", budget: 1200);
Proj(pid: 12, team: "blue", budget: 800);
Proj(pid: 13, team: "green", budget: 50);
Proj(pid: 14, team: "blue", budget: 90);
A(id: 1, pid: 10, hours: 8);
A(id: 1, pid: 11, hours: 4);
A(id: 2, pid: 10, hours: 12);
A(id: 3, pid: 12, hours: 20);
A(id: 3, pid: 14, hours: 2);
A(id: 4, pid: 12, hours: 6);
A(id: 6, pid: 11, hours: 15);
A(id: 5, pid: 13, hours: 1);
@OrderBy(Q, "team", "h");
Q(team:, h? += hours) distinct :- A(id:, hours:), Person(id:, team:);
