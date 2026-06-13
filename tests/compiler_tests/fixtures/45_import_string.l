# Test: Import string utilities

import lib.string_utils.Greeting;
import lib.data_utils.SampleNames;

# Greet all sample names
Greetings(name:, message:) :-
  SampleNames(name),
  Greeting(name, message);

@OrderBy(Test, "name");
Test(name:, message:) :- Greetings(name:, message:);
