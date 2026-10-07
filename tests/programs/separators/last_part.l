# The last part after a dot: the top-level domain of an address.
# Expect: rows Q = [("ada", "org"), ("ken", "com")]
E(name: "ada", email: "ada@analytical.org");
E(name: "ken", email: "ken@bell-labs.com");
@OrderBy(Q, "name");
Q(name:, tld: Element(parts, Size(parts) - 1)) :- E(name:, email:), parts == Split(email, ".");
