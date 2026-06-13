# Data utility predicates for import testing

# Sample data
SampleNumbers(x) :- x in [1, 2, 3, 4, 5];

# Sample names
SampleNames(name) :- name in ["Alice", "Bob", "Charlie"];

# Range helper
InRange(x, min, max) :- x >= min, x <= max;
