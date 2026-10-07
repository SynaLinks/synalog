# Mentoring has a cycle: 2 and 4 mentor each other.
# Expect: violated Loop.acyclic 2
# Expect: counterexamples Loop.acyclic = [(2,), (4,)]
Employees(person_id: 1, name: "ann", team_id: 10, status: "active");
Employees(person_id: 2, name: "bob", team_id: 10, status: "active");
Employees(person_id: 3, name: "cid", team_id: 20, status: "inactive");
Employees(person_id: 4, name: "dan", team_id: 20, status: "active");
Teams(team_id: 10, team: "core");
Teams(team_id: 20, team: "infra");
Teams(team_id: 30, team: "data");
Clients(client_id: 100, client: "acme");
Clients(client_id: 200, client: "globex");
Engagements(team_id: 10, client_id: 100);
Engagements(team_id: 20, client_id: 100);
Engagements(team_id: 30, client_id: 200);
Management(manager_id: 1, employee_id: 2);
Management(manager_id: 4, employee_id: 3);
Management(manager_id: 2, employee_id: 6);
Mentoring(mentor_id: 2, mentee_id: 4);
Mentoring(mentor_id: 4, mentee_id: 2);
Mentoring(mentor_id: 1, mentee_id: 3);
Person(person_id:, name:) distinct :- Employees(person_id:, name:);
Team(team_id:, team:) distinct :- Teams(team_id:, team:);
Client(client_id:, client:) distinct :- Clients(client_id:, client:);
MemberOf(person_id:, team_id:) distinct :- Person(person_id:), Team(team_id:), Employees(person_id:, team_id:);
EngagedWith(team_id:, client_id:) distinct :- Team(team_id:), Client(client_id:), Engagements(team_id:, client_id:);
Manages(manager_id:, employee_id:) distinct :- Person(person_id: manager_id), Person(person_id: employee_id), Management(manager_id:, employee_id:);
Mentors(mentor_id:, mentee_id:) distinct :- Person(person_id: mentor_id), Person(person_id: mentee_id), Mentoring(mentor_id:, mentee_id:);
@Recursive(Loop, 6);
Loop(a:, b:) distinct :- Mentors(mentor_id: a, mentee_id: b);
Loop(a:, b: c) distinct :- Loop(a:, b:), Mentors(mentor_id: b, mentee_id: c);
@Assert(Loop, acyclic: "∀ x, ¬ Loop x x");
