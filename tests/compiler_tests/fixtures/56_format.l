# Test: Format string interpolation

Items(name: "apple", qty: 5);
Items(name: "pear", qty: 2);

@OrderBy(Labels, "name");
Labels(name:, label: Format("%s x%s", name, ToString(qty))) :- Items(name:, qty:);

@OrderBy(Test, "name");
Test(name:, label:) :- Labels(name:, label:);
