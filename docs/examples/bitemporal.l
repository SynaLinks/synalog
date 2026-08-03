# run: EmployedAt, CurrentEmployment, EmploymentSnapshot, EmploymentAsKnownInMarch, Correction
@Engine("duckdb");

# Tables

## One row per version of a fact. Two half-open intervals:
##   [valid_from, valid_to)       when the fact holds in the world
##   [recorded_from, recorded_to) when the database believed it
## "9999-12-31" is the open end: still true / still believed.
EmploymentVersions(person_id: 1, company_id: "acme", role: "engineer",
  valid_from: "2024-01-01", valid_to: "9999-12-31",
  recorded_from: "2024-01-05", recorded_to: "2026-04-01");
EmploymentVersions(person_id: 1, company_id: "acme", role: "lead",
  valid_from: "2024-01-01", valid_to: "9999-12-31",
  recorded_from: "2026-04-01", recorded_to: "9999-12-31");
EmploymentVersions(person_id: 2, company_id: "acme", role: "engineer",
  valid_from: "2023-03-01", valid_to: "2025-01-01",
  recorded_from: "2023-03-02", recorded_to: "9999-12-31");

People(person_id: 1, name: "Ada", profile_url: "https://example.com/ada");
People(person_id: 2, name: "Grace", profile_url: "https://example.com/grace");
Companies(company_id: "acme", website: "https://acme.example.com");

# Concepts

@OrderBy(Person, "person_id");
Person(person_id:, name:, profile_url:) distinct :- People(person_id:, name:, profile_url:);

@OrderBy(Company, "company_id");
Company(company_id:, website:) distinct :- Companies(company_id:, website:);

## The bitemporal edge: every version, joined through the nodes.
@OrderBy(EmployedAt, "person_id", "recorded_from");
EmployedAt(person_id:, company_id:, role:,
           valid_from:, valid_to:, recorded_from:, recorded_to:) distinct :-
  Person(person_id:),
  Company(company_id:),
  EmploymentVersions(person_id:, company_id:, role:,
                     valid_from:, valid_to:, recorded_from:, recorded_to:);

# Rules

## The current view: valid now, and believed now.
@OrderBy(CurrentEmployment, "person_id");
CurrentEmployment(person_id:, name:, company_id:, role:) distinct :-
  EmployedAt(person_id:, company_id:, role:,
             valid_from:, valid_to:, recorded_to: "9999-12-31"),
  Person(person_id:, name:),
  Today(date:),
  valid_from <= date, date < valid_to;

## The vantage point, as a swappable predicate. The default is "now, as we
## know it now"; a functor application moves it anywhere on either axis.
AsOf(valid_date:, known_date:) :-
  Today(date:), valid_date == date, known_date == date;

@OrderBy(EmploymentSnapshot, "person_id");
EmploymentSnapshot(person_id:, company_id:, role:) distinct :-
  AsOf(valid_date:, known_date:),
  EmployedAt(person_id:, company_id:, role:,
             valid_from:, valid_to:, recorded_from:, recorded_to:),
  valid_from <= valid_date, valid_date < valid_to,
  recorded_from <= known_date, known_date < recorded_to;

## What the database said on 2026-03-01 about 2026-03-01: the pre-correction
## answer, reproduced exactly.
March2026(valid_date: "2026-03-01", known_date: "2026-03-01");
EmploymentAsKnownInMarch := EmploymentSnapshot(AsOf: March2026);

## The audit trail: a version that stopped being believed, and the version
## that replaced it.
@OrderBy(Correction, "person_id", "corrected_at");
Correction(person_id:, old_role:, new_role:, corrected_at:) distinct :-
  EmployedAt(person_id:, role: old_role, recorded_to: corrected_at),
  corrected_at != "9999-12-31",
  EmployedAt(person_id:, role: new_role, recorded_from: corrected_at);
