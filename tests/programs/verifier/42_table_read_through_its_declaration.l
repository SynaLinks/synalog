# Tables declared once, then read through their predicates, also in a negation.
# Expect: valid

GroundTruth(npi:, scheme:) :- ground_truth(npi:, scheme:);
Listed(npi:) :- providers(npi:);
Unlisted(npi:) :- Listed(npi:), ~GroundTruth(npi:);
