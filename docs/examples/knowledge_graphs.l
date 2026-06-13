# run: Person, Team, Client, MemberOf, EngagedWith, WorksWithClient, ReportsTo
@Engine("duckdb");

# Tables
Employees(person_id: 1, name: "Ada", role: "engineer", manager_id: 2);
Employees(person_id: 2, name: "Grace", role: "lead", manager_id: null);
Employees(person_id: 3, name: "Alan", role: "engineer", manager_id: 2);

TeamAssignments(person_id: 1, team_id: "core");
TeamAssignments(person_id: 2, team_id: "core");
TeamAssignments(person_id: 3, team_id: "platform");

Engagements(team_id: "core", client_id: "acme", website: "https://acme.example.com");
Engagements(team_id: "platform", client_id: "globex", website: "https://globex.example.com");

# Concepts

## Nodes: primary key first, URLs preserved.
@OrderBy(Person, "person_id");
Person(person_id:, name:, role:) distinct :- Employees(person_id:, name:, role:);

@OrderBy(Team, "team_id");
Team(team_id:) distinct :- TeamAssignments(team_id:);

@OrderBy(Client, "client_id");
Client(client_id:, website:) distinct :- Engagements(client_id:, website:);

## Edges join through nodes, not raw tables.
@OrderBy(MemberOf, "person_id");
MemberOf(person_id:, team_id:) distinct :-
  Person(person_id:),
  Team(team_id:),
  TeamAssignments(person_id:, team_id:);

@OrderBy(EngagedWith, "team_id");
EngagedWith(team_id:, client_id:) distinct :-
  Team(team_id:),
  Client(client_id:),
  Engagements(team_id:, client_id:);

## Inverse edge derived from the management relation.
@OrderBy(ReportsTo, "employee_id");
ReportsTo(employee_id:, manager_id:) distinct :-
  Person(person_id: employee_id),
  Person(person_id: manager_id),
  Employees(person_id: employee_id, manager_id:), manager_id is not null;

# Rules

## Edge composition: person -> team -> client gives person -> client.
@OrderBy(WorksWithClient, "person_id");
WorksWithClient(person_id:, client_id:) distinct :-
  MemberOf(person_id:, team_id:),
  EngagedWith(team_id:, client_id:);
