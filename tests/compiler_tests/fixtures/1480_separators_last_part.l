# Test: The last part after a dot: the top-level domain of an address. (from tests/programs/separators/last_part.l)

E(name: "ada", email: "ada@analytical.org");
E(name: "ken", email: "ken@bell-labs.com");
@OrderBy(Q, "name");
Q(name:, tld: Element(parts, Size(parts) - 1)) :- E(name:, email:), parts == Split(email, ".");
