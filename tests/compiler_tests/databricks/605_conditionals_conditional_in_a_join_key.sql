WITH t_0_Name AS (SELECT * FROM VALUES
  (0, "even"),
  (1, "odd")
AS UNUSED_TABLE_NAME(p, n))
SELECT
  x_6 AS x,
  Name.n AS n
FROM
  t_0_Name AS Name, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
WHERE
  (Name.p = CASE WHEN ((MOD(x_6, NULLIF(2, 0))) = 0) THEN 0 ELSE 1 END) ORDER BY x NULLS LAST;