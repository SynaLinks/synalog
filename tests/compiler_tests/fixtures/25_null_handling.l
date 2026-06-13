# Test: Null handling edge cases

# Data with nulls
Data(1, "Alice", "alice@example.com");
Data(2, "Bob", null);
Data(3, null, "charlie@example.com");
Data(4, null, null);

# Check for null values
HasNullName(id, name) :- Data(id, name, email), name is null;

# Check for non-null values
HasValidEmail(id, email) :- Data(id, name, email), email is not null;

# Coalesce to provide defaults
WithDefaults(id, display_name) :-
  Data(id, name, email),
  display_name == Coalesce(name, "Unknown");

# Multiple Coalesce arguments
BestContact(id, contact) :-
  Data(id, name, email),
  contact == Coalesce(email, name, "No contact");

@OrderBy(Test, "id");
Test(id:, display_name:) :- WithDefaults(id, display_name);
