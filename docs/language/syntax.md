# Syntax

## Named arguments

Synalog uses **named arguments only**: there are no positional arguments. In `Predicate(column_name: variable)`, the left side of `:` is the **column name** in the predicate, and the right side is **your variable name**:

```logica
# column "amount" bound to variable "total"
Orders(amount: total)

# shorthand: column and variable share the same name
Orders(amount:)
```

!!! danger "Left side is the column, right side is the variable"
    `Orders(total: amount)` does **not** bind the `amount` column to `total`; it looks for a column named `total`. When in doubt, write the column name on the left.

## Variables and expressions

Variables are defined with `==`:

```logica
OrderWithTax(order_id:, total:) :-
  Orders(order_id:, amount:),
  total == amount * 1.10;
```

### Operators

| Category | Operators |
|----------|-----------|
| Arithmetic | `+` `-` `*` `/` `^` (power) `%` (remainder, with the sign of the dividend: `-7 % 3` is `-1`, `7.5 % 2` is `1.5`); `/` divides exactly (`7 / 2` is `3.5`); a division or remainder by zero has no value (null); a number with a decimal point is a double (`0.1 + 0.2 == 0.3` does not hold); `-` negates also right after another operator (`2 * -3`) |
| String concatenation | `++` |
| Comparison | `==` `!=` `<` `>` `<=` `>=` |
| Boolean | `&&` `\|\|` `!`; a boolean variable or field alone is a condition (`Active(id:) :- Person(id:, active:), active;`), as `!active` is |
| Membership | `x in [1, 2, 3]` |
| Null tests | `x is null`, `x is not null` |

### Strings

A string is written in double quotes, `"north"`, single quotes, `'north'`, or triple double quotes, `"""north"""`. Only single-quoted strings take backslash escapes (`'it\'s'`, `'a\tb'`); a double-quoted string ends at the next `"`, so to put a double quote in a string, single-quote it or triple-quote it:

```logica
Quote(a: 'say "hi"', b: """say "hi" there""", c: 'it\'s');
```

!!! danger "Never compare against null with `!=`"
    `x != null` is silently broken (it follows SQL three-valued logic and never matches). Always use `x is null` / `x is not null`.

## Logical operators

**Conjunction (AND)**: comma `,` joins predicates:

```logica
Result(x:, y:) :- TableA(x:), TableB(x:, y:);
```

**Disjunction (OR)**: pipe `|` combines results (UNION ALL semantics; add `distinct` to deduplicate):

```logica
Combined(x:) distinct :- SourceA(x:) | SourceB(x:);
```

**Negation (NOT)**: tilde `~`:

```logica
Inactive(user_id:) :- Users(user_id:), ~Logins(user_id:);
```

**Multiple rule definitions**: defining the same predicate several times unions the bodies:

```logica
HighValue(user_id:) :- Orders(user_id:, amount:), amount > 10000;
HighValue(user_id:) :- Referrals(user_id:, tier: "vip");
```

A practical combination: contact customers by email when available, otherwise by phone:

```logica
@OrderBy(ContactableCustomer, "customer_id");
ContactableCustomer(customer_id:, channel:) distinct :-
  Customers(customer_id:, email:), email is not null, channel == "email" |
  Customers(customer_id:, phone:), phone is not null, channel == "phone";
```

## Null handling

```logica
MissingEmail(user_id:) :- Users(user_id:, email:), email is null;
HasEmail(user_id:, email:) :- Users(user_id:, email:), email is not null;
UserDisplay(user_id:, name:) :- Users(user_id:, full_name:), name == Coalesce(full_name, "Anonymous");
```

A null equals nothing, another null included: a join on a column finds no row where the key is null (`A(k:), B(k:)` with both `k` null), and neither does a negation (`~B(k:)` holds). Replace a null key before joining when it should match (`B(k: Coalesce(k, 0))`).

## Conditionals

`if … then … else` expressions, chainable with `else if`:

```logica
OrderSize(order_id:, size:) :-
  Orders(order_id:, amount:),
  size == (if amount > 1000 then "large"
           else if amount > 100 then "medium"
           else "small");
```

## Records

Build nested record values with `{field:, field:}`:

```logica
UserInfo(user_id:, info:) :- Users(user_id:, name:, email:), info == {name:, email:};
```

## Complete example

Variables, disjunction, negation, conditionals and null handling in one runnable program:

```logica
--8<-- "docs/examples/syntax.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/syntax.log"
    ```
