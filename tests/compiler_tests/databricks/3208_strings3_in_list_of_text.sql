WITH t_0_V AS (SELECT * FROM VALUES
  ("b"),
  ("B")
AS UNUSED_TABLE_NAME(w))
SELECT
  V.w AS w
FROM
  t_0_V AS V, LATERAL (SELECT explode(ARRAY("a", "b")) AS x_2) AS pushkin
WHERE
  (V.w = x_2);