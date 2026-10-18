# Test: A negation of a predicate that reads a database table: the table has no rules to inline, and synalog panicked looking at the first one (index out of bounds). An assertion whose conclusion applies a table predicate to all its columns is searched with such a negation.

GroundTruth(npi:, scheme:) :- ground_truth(npi:, scheme:);
Listed(npi:, scheme:) :- providers(npi:, scheme:);
Unlisted(npi:) :- Listed(npi:, scheme:), ~GroundTruth(npi:, scheme:);
