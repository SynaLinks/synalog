# A database table is read through the predicate that declares it, never directly.
# Expect: error 'ground_truth' is a database table: read it through 'GroundTruth', the predicate that declares it

GroundTruth(npi:, scheme:) :- ground_truth(npi:, scheme:);
Listed(npi:) :- providers(npi:);
Unlisted(npi:) :- Listed(npi:), ~ground_truth(npi:);
