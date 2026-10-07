# Spark substitutes ${...} in a statement's text: a string never reaches it so.
# Expect: rows Q = [("${env:HOME}",)]
Q(s: "${env:HOME}");
