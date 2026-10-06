WITH t_1_L AS (SELECT
  ARRAY_AGG(DISTINCT x_3) AS l
FROM
  UNNEST(TRANSFORM(ARRAY[1, 1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3))
SELECT
  CARDINALITY(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;