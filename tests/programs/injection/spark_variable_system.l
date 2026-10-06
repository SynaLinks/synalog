# Nor a system property.
# Expect: rows Q = [("${system:user.name}",)]
Q(s: "${system:user.name}");
