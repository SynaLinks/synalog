# Paths whose hops are valid at the same time.
# Expect: rows ReachedBy = [('a', 'b', '2024-01-01', '2024-03-01'), ('a', 'c', '2024-02-01', '2024-03-01'), ('a', 'c', '2024-03-15', '2024-04-15'), ('b', 'c', '2024-02-01', '2024-04-01'), ('c', 'd', '2024-05-01', '2024-06-01')]
Employees(person_id: 1, name: "ann", dept: "eng", team_id: 10, status: "active", url: "https://x/ann");
Employees(person_id: 2, name: "bob", dept: "eng", team_id: 10, status: "active", url: "https://x/bob");
Employees(person_id: 3, name: "cid", dept: "ops", team_id: 20, status: "inactive", url: "https://x/cid");
Employees(person_id: 4, name: "dan", dept: "ops", team_id: 20, status: "active", url: "https://x/dan");
Employees(person_id: 5, name: "eve", dept: "eng", team_id: 30, status: "active", url: "https://x/eve");
Teams(team_id: 10, team: "core");
Teams(team_id: 20, team: "infra");
Teams(team_id: 30, team: "data");
Clients(client_id: 100, client: "acme");
Clients(client_id: 200, client: "globex");
Engagements(team_id: 10, client_id: 100);
Engagements(team_id: 20, client_id: 100);
Engagements(team_id: 30, client_id: 200);
Management(manager_id: 1, employee_id: 2);
Management(manager_id: 1, employee_id: 5);
Management(manager_id: 4, employee_id: 3);
Management(manager_id: 2, employee_id: 6);
Mentoring(mentor_id: 2, mentee_id: 5);
Mentoring(mentor_id: 1, mentee_id: 4);
@OrderBy(Person, "person_id");
Person(person_id:, name:, url:) distinct :- Employees(person_id:, name:, url:);
@OrderBy(Team, "team_id");
Team(team_id:, team:) distinct :- Teams(team_id:, team:);
@OrderBy(Client, "client_id");
Client(client_id:, client:) distinct :- Clients(client_id:, client:);
MemberOf(person_id:, team_id:) distinct :- Person(person_id:), Team(team_id:), Employees(person_id:, team_id:);
EngagedWith(team_id:, client_id:) distinct :- Team(team_id:), Client(client_id:), Engagements(team_id:, client_id:);
Manages(manager_id:, employee_id:) distinct :- Person(person_id: manager_id), Person(person_id: employee_id), Management(manager_id:, employee_id:);
Mentors(mentor_id:, mentee_id:) distinct :- Person(person_id: mentor_id), Person(person_id: mentee_id), Mentoring(mentor_id:, mentee_id:);
HandedOver(source: "a", target: "b", valid_from: "2024-01-01", valid_to: "2024-03-01");
HandedOver(source: "b", target: "c", valid_from: "2024-02-01", valid_to: "2024-04-01");
HandedOver(source: "c", target: "d", valid_from: "2024-05-01", valid_to: "2024-06-01");
HandedOver(source: "a", target: "c", valid_from: "2024-03-15", valid_to: "2024-04-15");
@Recursive(ReachedBy, 10);
@OrderBy(ReachedBy, "source", "target", "valid_from");
ReachedBy(source:, target:, valid_from:, valid_to:) distinct :- HandedOver(source:, target:, valid_from:, valid_to:);
ReachedBy(source:, target:, valid_from:, valid_to:) distinct :-
  ReachedBy(source:, target: mid, valid_from: p_from, valid_to: p_to),
  HandedOver(source: mid, target:, valid_from: h_from, valid_to: h_to),
  valid_from == (if p_from > h_from then p_from else h_from),
  valid_to == (if p_to < h_to then p_to else h_to),
  valid_from < valid_to;
