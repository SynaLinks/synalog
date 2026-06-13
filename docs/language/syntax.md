# Syntax

## Named arguments

Synalog uses **named arguments only** — there are no positional arguments. In `Predicate(column_name: variable)`, the left side of `:` is the **column name** in the predicate, and the right side is **your variable name**:

```logica
# column "amount" bound to variable "total"
Orders(amount: total)

# shorthand: column and variable share the same name
Orders(amount:)
```

!!! danger "Left side is the column, right side is the variable"
    `Orders(total: amount)` does **not** bind the `amount` column to `total` — it looks for a column named `total`. When in doubt, write the column name on the left.

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
| Arithmetic | `+` `-` `*` `/` `^` (power) `%` (modulo) |
| String concatenation | `++` |
| Comparison | `==` `!=` `<` `>` `<=` `>=` |
| Boolean | `&&` `\|\|` `!` |
| Membership | `x in [1, 2, 3]` |
| Null tests | `x is null`, `x is not null` |

!!! danger "Never compare against null with `!=`"
    `x != null` is silently broken (it follows SQL three-valued logic and never matches). Always use `x is null` / `x is not null`.

## Logical operators

**Conjunction (AND)** — comma `,` joins predicates:

```logica
Result(x:, y:) :- TableA(x:), TableB(x:, y:);
```

**Disjunction (OR)** — pipe `|` combines results (UNION ALL semantics; add `distinct` to deduplicate):

```logica
Combined(x:) distinct :- SourceA(x:) | SourceB(x:);
```

**Negation (NOT)** — tilde `~`:

```logica
Inactive(user_id:) :- Users(user_id:), ~Logins(user_id:);
```

**Multiple rule definitions** — defining the same predicate several times unions the bodies:

```logica
HighValue(user_id:) :- Orders(user_id:, amount:), amount > 10000;
HighValue(user_id:) :- Referrals(user_id:, tier: "vip");
```

A practical combination — contact customers by email when available, otherwise by phone:

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
