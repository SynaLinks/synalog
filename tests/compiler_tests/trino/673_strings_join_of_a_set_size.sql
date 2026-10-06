WITH t_0_C AS (SELECT
  ARRAY_AGG(DISTINCT x_3) AS s
FROM
  UNNEST(TRANSFORM(SPLIT('a b a', ' '), synalog_e -> ROW(synalog_e))) as pushkin(x_3))
SELECT
  CARDINALITY(C.s) AS n
FROM
  t_0_C AS C;