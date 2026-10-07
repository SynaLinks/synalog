WITH t_1_L AS (SELECT * FROM VALUES
  (1, ARRAY(1, 2, 3)),
  (2, ARRAY()),
  (3, ARRAY(7)),
  (4, ARRAY(5, 5, 9, 1))
AS UNUSED_TABLE_NAME(k, l))
SELECT
  t_0_L.k AS k
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_3) AS pushkin
WHERE
  (1 = x_3) ORDER BY k NULLS LAST;