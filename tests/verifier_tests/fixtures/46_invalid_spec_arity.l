# Verifier Test: Spec applying a predicate to the wrong number of arguments
# Expected Error: invalidSpec
#
# A statement applies a predicate to its columns in the order its first rule
# declares them. `Ancestor` has two columns (x, y), so `Ancestor x` is neither
# the relation (two arguments) nor a function of its first column returning the
# last (one argument, but used here as a formula).

@Spec(Ancestor, irreflexive: "∀ x, ¬ Ancestor x");

Ancestor(x:, y:) :- parent(x:, y:);
