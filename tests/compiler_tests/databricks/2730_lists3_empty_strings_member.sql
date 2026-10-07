WITH t_0_S AS (SELECT * FROM VALUES
  (1, ARRAY("a", "b")),
  (2, ARRAY()),
  (3, CAST(null AS ARRAY<STRING>))
AS UNUSED_TABLE_NAME(k, l))
SELECT
  S.k AS k
FROM
  t_0_S AS S, LATERAL (SELECT explode(S.l) AS x_3) AS pushkin
WHERE
  ("a" = x_3);