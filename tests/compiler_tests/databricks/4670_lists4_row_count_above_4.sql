WITH t_1_L AS (SELECT * FROM VALUES
  (1, ARRAY(1, 2, 3)),
  (2, ARRAY()),
  (3, ARRAY(7)),
  (4, ARRAY(5, 5, 9, 1)),
  (5, CAST(null AS ARRAY<DOUBLE>))
AS UNUSED_TABLE_NAME(k, l))
SELECT
  t_0_L.k AS k,
  (SELECT SUM(synalog_p.synalog_c0) FROM LATERAL (SELECT explode(TRANSFORM(FILTER(COALESCE(t_0_L.l, ARRAY()), synalog_u0 -> (synalog_u0 > 4)), synalog_u0 -> 1)) AS synalog_c0) AS synalog_p) AS v
FROM
  t_1_L AS t_0_L ORDER BY k NULLS LAST;