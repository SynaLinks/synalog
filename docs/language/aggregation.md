# Aggregation

Aggregation happens in the rule **head**, together with the `distinct` keyword. The `?` marks the aggregated output column.

```synalog
@OrderBy(Stats, "category");
Stats(category:, total? += amount, count? += 1) distinct :- Sales(category:, amount:);
```

Non-aggregated head columns (`category` above) become the grouping key, like `GROUP BY` in SQL.

## Aggregation operators

| Operator | Meaning |
|----------|---------|
| `col? += expr` | Sum (use `+= 1` to count) |
| `col? Min= expr` | Minimum |
| `col? Max= expr` | Maximum |
| `col? Avg= expr` | Average |
| `col? List= expr` | Collect all values into an array |
| `col? Set= expr` | Collect distinct values into an array |
| `col? Count= expr` | Number of distinct values, nulls not counted |
| `col? ArgMax= item -> score` | The `item` with the highest `score` |
| `col? ArgMin= item -> score` | The `item` with the lowest `score` |

```synalog
# Sum
Revenue(total? += amount) distinct :- Orders(amount:);

# Count
OrderCount(n? += 1) distinct :- Orders(order_id:);

# Min / Max
Cheapest(min_price? Min= price) distinct :- Products(price:);
Priciest(max_price? Max= price) distinct :- Products(price:);

# Average
AvgOrder(avg? Avg= amount) distinct :- Orders(amount:);

# Collect into list / set
AllNames(names? List= name) distinct :- Users(name:);
UniqueNames(names? Set= name) distinct :- Users(name:);

# Value with max key
TopSeller(name? ArgMax= name -> revenue) distinct :- Sales(name:, revenue:);
```

!!! danger "Counting"
    Never use `Count()`. Use `count? += 1` instead.

## More aggregating functions

In addition to the operators above: `Array= key -> value` (the values in an array, ordered by their key), `StringAgg= x` (the values as text, joined with `,`, in no particular order; null when they are all null), `1= x` (any single value), and `ArgMaxK` and `ArgMinK` (the `k` items of highest or lowest score). These two take how many items to keep: name one with its count, then aggregate with the name:

```synalog
Top3(x) = ArgMaxK(x, 3);
Podium(race:, top? Top3= runner -> points) distinct :- Result(race:, runner:, points:);
```

An aggregate aggregates only as an operator (`n? Max= x`) or in a `combine`: called as a value (`Q(t: Max(x))`) or in a condition (`x == Max(x)`), it is refused.

## Nulls and empty groups

`+=`, `Min=`, `Max=`, `Avg=` and `Count=` skip a null value; `List=` and `Set=` collect it like any other (`List= x` over 1, null, 2 is `[1, null, 2]`). `Min=` and `Max=` order booleans false before true, and text by code point (`"B"` before `"a"`).

With a grouping key, a group exists only when it has rows, so an aggregation over no rows gives no row. Without one, it gives a single row: `+=`, `Min=`, `Max=`, `Avg=`, `List=`, `Set=` and `Array=` are null there and `Count=` is 0. To count 0 instead of null, use `Coalesce`:

```synalog
Big(n? += 1) distinct :- Orders(amount:), amount > 1000;     # one row: null when no order is over 1000
BigCount(n: Coalesce(c, 0)) :- Big(n: c);
```

## `combine`: an aggregate as a value

`(combine Op= expr :- body)` is the aggregate of `body`'s rows, used as a value anywhere a value is: in a head, a condition, a function. The body sees the variables of the enclosing rule, so the aggregate is computed for each of its rows, like a correlated subquery:

```synalog
# Each customer's total, null for a customer without orders.
CustomerTotal(customer_id:, total: (combine += amount :- Orders(customer_id:, amount:))) :-
  Customer(customer_id:);

# Orders above their customer's average.
AboveAverage(order_id:) :-
  Orders(order_id:, customer_id:, amount:),
  amount > (combine Avg= a :- Orders(customer_id:, amount: a));

# Customers who spent over 1000: a combine in a condition.
BigSpender(customer_id:) :- Customer(customer_id:),
  (combine += amount :- Orders(customer_id:, amount:)) > 1000;
```

Every aggregating operator works in a `combine`. Over no rows it follows the rule above: null, and 0 for `Count=`; write `Coalesce((combine += 1 :- ...), 0)` to count 0. The body can range over the elements of a list of the enclosing row (`(combine Max= y :- y in l, y > 1)`), and can hold conditions and negations, but no disjunction: put the alternatives in a predicate of their own.

## Deduplication without aggregation

`distinct` on its own deduplicates rows, and this is how concepts extract unique entities:

```synalog
@OrderBy(Customer, "customer_id");
Customer(customer_id:) distinct :- Orders(customer_id:);
```

## Complete example

Sum, count, min/max/avg, `Set=` collection and `ArgMax=` over a small sales table:

```synalog
--8<-- "docs/examples/aggregation.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/aggregation.log"
    ```
