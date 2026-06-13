# Test: Nested record access

# Data with nested records
Person(id: 1, info: {name: "Alice", contact: {email: "alice@example.com", phone: "123"}});
Person(id: 2, info: {name: "Bob", contact: {email: "bob@example.com", phone: "456"}});

# Access nested field
Names(id, name) :-
  Person(id:, info:),
  name == info.name;

# Access deeply nested field
Emails(id, email) :-
  Person(id:, info:),
  email == info.contact.email;

# Extract multiple nested fields
ContactInfo(id, name, email, phone) :-
  Person(id:, info:),
  name == info.name,
  email == info.contact.email,
  phone == info.contact.phone;

# Create new record from nested data
Summary(id, summary) :-
  Person(id:, info:),
  summary == {person_name: info.name, person_email: info.contact.email};

@OrderBy(Test, "id");
Test(id, name, email) :- ContactInfo(id, name, email, phone);
