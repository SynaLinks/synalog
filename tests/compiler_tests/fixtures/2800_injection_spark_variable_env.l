# Test: Spark substitutes ${...} in a statement's text: a string never reaches it so. (from tests/programs/injection/spark_variable_env.l)

Q(s: "${env:HOME}");
