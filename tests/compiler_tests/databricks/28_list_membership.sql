WITH t_0_Items AS (SELECT * FROM VALUES
  ("apple", "fruit", 1.50E0),
  ("banana", "fruit", 0.75E0),
  ("carrot", "vegetable", 0.50E0),
  ("milk", "dairy", 2.00E0),
  ("bread", "grain", 1.25E0)
AS UNUSED_TABLE_NAME(col0, col1, col2))
SELECT
  Items.col0 AS name,
  Items.col2 AS price
FROM
  t_0_Items AS Items, LATERAL (SELECT explode(ARRAY("fruit", "vegetable")) AS x_9) AS pushkin
WHERE
  (Items.col1 = x_9) ORDER BY name NULLS LAST;