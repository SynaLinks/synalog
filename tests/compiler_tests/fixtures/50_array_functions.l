# Test: Array functions (ArrayConcat, Size, Element)

Lists(id: 1, a: [1, 2], b: [3, 4]);
Lists(id: 2, a: [5], b: [6, 7, 8]);

# Concatenate two arrays and measure the result
@OrderBy(Concatenated, "id");
Concatenated(id:, total_size:, head:) :-
  Lists(id:, a:, b:),
  combined == ArrayConcat(a, b),
  total_size == Size(combined),
  head == Element(combined, 0);

@OrderBy(Test, "id");
Test(id:, total_size:, head:) :- Concatenated(id:, total_size:, head:);
