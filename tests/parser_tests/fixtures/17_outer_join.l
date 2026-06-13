# Test: Outer joins via multi-body aggregation
@Engine("duckdb");

Phones(person: "Alice", phone: "555-1234");
Phones(person: "Bob", phone: "555-5678");
Emails(person: "Bob", email: "bob@example.com");
Emails(person: "Charlie", email: "charlie@example.com");

# Left outer join simulation using multi-body aggregation
@OrderBy(ContactInfo, "person");
ContactInfo(person:, phones? ++= [phone], emails? ++= []) distinct :-
  Phones(person:, phone:);
ContactInfo(person:, phones? ++= [], emails? ++= [email]) distinct :-
  Emails(person:, email:);

# Using ? for optional aggregation
@OrderBy(PersonSummary, "person");
PersonSummary(person:,
              has_phone? Max= 1,
              has_email? Max= 0) distinct :- Phones(person:, phone:);
PersonSummary(person:,
              has_phone? Max= 0,
              has_email? Max= 1) distinct :- Emails(person:, email:);

@OrderBy(Test, "person");
Test(person:, phones:, emails:) :- ContactInfo(person:, phones:, emails:);
