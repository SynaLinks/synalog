# Colleagues for the time their memberships overlap.
# Expect: rows Colleague = [(1, 2, 10, '2022-01-01', '2023-06-01'), (2, 4, 10, '2024-02-01', '9999-12-31')]
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
Events(person_id: 1, team_id: 10, changed_at: "2022-01-01");
Events(person_id: 1, team_id: 30, changed_at: "2023-06-01");
Events(person_id: 2, team_id: 10, changed_at: "2021-03-01");
Events(person_id: 4, team_id: 20, changed_at: "2020-01-01");
Events(person_id: 4, team_id: 10, changed_at: "2024-02-01");
NextChange(person_id:, changed_at:, next? Min= later) distinct :- Events(person_id:, changed_at:), Events(person_id:, changed_at: later), later > changed_at;
Member(person_id:, team_id:, valid_from:, valid_to:) distinct :- Person(person_id:), Team(team_id:), Events(person_id:, team_id:, changed_at: valid_from), NextChange(person_id:, changed_at: valid_from, next: valid_to);
Member(person_id:, team_id:, valid_from:, valid_to:) distinct :- Person(person_id:), Team(team_id:), Events(person_id:, team_id:, changed_at: valid_from), ~NextChange(person_id:, changed_at: valid_from), valid_to == "9999-12-31";
@OrderBy(Colleague, "person_a", "person_b", "valid_from");
Colleague(person_a:, person_b:, team_id:, valid_from:, valid_to:) distinct :-
  Member(person_id: person_a, team_id:, valid_from: a_from, valid_to: a_to),
  Member(person_id: person_b, team_id:, valid_from: b_from, valid_to: b_to),
  person_a < person_b,
  valid_from == (if a_from > b_from then a_from else b_from),
  valid_to == (if a_to < b_to then a_to else b_to),
  valid_from < valid_to;
