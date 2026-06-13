# Aggregation

Aggregation happens in the rule **head**, together with the `distinct` keyword. The `?` marks the aggregated output column.

```logica
@OrderBy(Stats, "category");
Stats(category:, total? += amount, count? += 1) distinct :- Sales(category:, amount:);
```

Non-aggregated head columns (`category` above) become the grouping key — like `GROUP BY` in SQL.

## Aggregation operators

| Operator | Meaning |
|----------|---------|
| `col? += expr` | Sum (use `+= 1` to count) |
| `col? Min= expr` | Minimum |
| `col? Max= expr` | Maximum |
| `col? Avg= expr` | Average |
| `col? List= expr` | Collect all values into an array |
| `col? Set= expr` | Collect distinct values into an array |
| `col? ArgMax= item -> score` | The `item` with the highest `score` |
| `col? ArgMin= item -> score` | The `item` with the lowest `score` |

```logica
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
    Never use `Count()` — use `count? += 1` instead.

## More aggregating functions

In addition to the operators above: `Array= x -> y` (ordered array), `ArgMinK(x -> y, k)` and `ArgMaxK(x -> y, k)` (top-k), `StringAgg= x` (string concatenation), `1= x` (any single value).

## Deduplication without aggregation

`distinct` on its own deduplicates rows — this is how concepts extract unique entities:

```logica
@OrderBy(Customer, "customer_id");
Customer(customer_id:) distinct :- Orders(customer_id:);
```

## Complete example

Sum, count, min/max/avg, `Set=` collection and `ArgMax=` over a small sales table:

```logica
--8<-- "docs/examples/aggregation.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/aggregation.log"
    ```
