# run: PersonNode, TeamNode, ClientNode, MemberOfEdge, EngagedWithEdge, WorksWithClientEdge, ReportsToEdge
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
@OrderBy(PersonNode, "person_id");
PersonNode(person_id:, name:, role:) distinct :- Employees(person_id:, name:, role:);

@OrderBy(TeamNode, "team_id");
TeamNode(team_id:) distinct :- TeamAssignments(team_id:);

@OrderBy(ClientNode, "client_id");
ClientNode(client_id:, website:) distinct :- Engagements(client_id:, website:);

## Edges join through nodes, not raw tables.
@OrderBy(MemberOfEdge, "person_id");
MemberOfEdge(person_id:, team_id:) distinct :-
  PersonNode(person_id:),
  TeamNode(team_id:),
  TeamAssignments(person_id:, team_id:);

@OrderBy(EngagedWithEdge, "team_id");
EngagedWithEdge(team_id:, client_id:) distinct :-
  TeamNode(team_id:),
  ClientNode(client_id:),
  Engagements(team_id:, client_id:);

## Inverse edge derived from the management relation.
@OrderBy(ReportsToEdge, "employee_id");
ReportsToEdge(employee_id:, manager_id:) distinct :-
  PersonNode(person_id: employee_id),
  PersonNode(person_id: manager_id),
  Employees(person_id: employee_id, manager_id:), manager_id is not null;

# Rules

## Edge composition: person -> team -> client gives person -> client.
@OrderBy(WorksWithClientEdge, "person_id");
WorksWithClientEdge(person_id:, client_id:) distinct :-
  MemberOfEdge(person_id:, team_id:),
  EngagedWithEdge(team_id:, client_id:);
