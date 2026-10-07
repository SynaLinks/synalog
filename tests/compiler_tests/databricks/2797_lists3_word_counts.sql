WITH t_1_W AS (SELECT * FROM VALUES
  (1, "red green blue"),
  (2, "red red"),
  (3, "blue"),
  (4, "")
AS UNUSED_TABLE_NAME(id, s))
SELECT
  x_2 AS w,
  SUM(1) AS n
FROM
  t_1_W AS t_0_W, LATERAL (SELECT explode(SPLIT(t_0_W.s, REGEXP_REPLACE(" ", '([^a-zA-Z0-9])', '\\\\$1'))) AS x_2) AS pushkin
WHERE
  (x_2 != "")
GROUP BY 1 ORDER BY w NULLS LAST, n NULLS LAST;