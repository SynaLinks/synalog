# run: MemberOf, ActiveMember, Colleague, ReachedBy
@Engine("duckdb");

# An event log: one row per role change, no end date.
Assignments(person_id: 1, team_id: "core", changed_at: "2024-01-01");
Assignments(person_id: 1, team_id: "platform", changed_at: "2026-02-01");
Assignments(person_id: 2, team_id: "core", changed_at: "2023-05-01");
Assignments(person_id: 3, team_id: "platform", changed_at: "2024-09-01");

People(person_id: 1, name: "Ada");
People(person_id: 2, name: "Grace");
People(person_id: 3, name: "Alan");

Teams(team_id: "core");
Teams(team_id: "platform");
Teams(team_id: "support");

# Directed handovers between teams, each valid over a period.
Handovers(source: "core", target: "platform", valid_from: "2024-01-01", valid_to: "2027-01-01");
Handovers(source: "platform", target: "support", valid_from: "2025-06-01", valid_to: "2027-01-01");
Handovers(source: "support", target: "core", valid_from: "2020-01-01", valid_to: "2021-01-01");

@OrderBy(Person, "person_id");
Person(person_id:, name:) distinct :- People(person_id:, name:);

@OrderBy(Team, "team_id");
Team(team_id:) distinct :- Teams(team_id:);

# The next change for a person, if there is one.
@OrderBy(NextChange, "person_id", "changed_at");
NextChange(person_id:, changed_at:, next? Min= later) distinct :-
  Assignments(person_id:, changed_at:),
  Assignments(person_id:, changed_at: later),
  later > changed_at;

# A valid-time edge, half-open: [valid_from, valid_to).
# An assignment ends where the next one starts, or never.
@OrderBy(MemberOf, "person_id", "valid_from");
MemberOf(person_id:, team_id:, valid_from:, valid_to:) distinct :-
  Person(person_id:),
  Team(team_id:),
  Assignments(person_id:, team_id:, changed_at: valid_from),
  NextChange(person_id:, changed_at: valid_from, next: valid_to);
MemberOf(person_id:, team_id:, valid_from:, valid_to:) distinct :-
  Person(person_id:),
  Team(team_id:),
  Assignments(person_id:, team_id:, changed_at: valid_from),
  ~NextChange(person_id:, changed_at: valid_from),
  valid_to == "9999-12-31";

@OrderBy(HandedOver, "source", "valid_from");
HandedOver(source:, target:, valid_from:, valid_to:) distinct :-
  Team(team_id: source),
  Team(team_id: target),
  Handovers(source:, target:, valid_from:, valid_to:);

# Edges valid right now.
@OrderBy(ActiveMember, "person_id");
ActiveMember(person_id:, name:, team_id:) distinct :-
  MemberOf(person_id:, team_id:, valid_from:, valid_to:),
  Person(person_id:, name:),
  Today(date:),
  valid_from <= date, date < valid_to;

# Two memberships that overlap in time: the derived edge carries the
# intersection [max(starts), min(ends)) and exists only if it is non-empty.
@OrderBy(Colleague, "person_a", "person_b");
Colleague(person_a:, person_b:, team_id:, valid_from:, valid_to:) distinct :-
  MemberOf(person_id: person_a, team_id:, valid_from: a_from, valid_to: a_to),
  MemberOf(person_id: person_b, team_id:, valid_from: b_from, valid_to: b_to),
  person_a < person_b,
  valid_from == (if a_from > b_from then a_from else b_from),
  valid_to == (if a_to < b_to then a_to else b_to),
  valid_from < valid_to;

# Time-respecting reachability: a path exists only if every hop shares a
# common validity window, so the intersection is carried along the recursion.
@Recursive(ReachedBy, 10);
@OrderBy(ReachedBy, "source", "target");
ReachedBy(source:, target:, valid_from:, valid_to:) distinct :-
  HandedOver(source:, target:, valid_from:, valid_to:);
ReachedBy(source:, target:, valid_from:, valid_to:) distinct :-
  ReachedBy(source:, target: mid, valid_from: p_from, valid_to: p_to),
  HandedOver(source: mid, target:, valid_from: h_from, valid_to: h_to),
  valid_from == (if p_from > h_from then p_from else h_from),
  valid_to == (if p_to < h_to then p_to else h_to),
  valid_from < valid_to;
