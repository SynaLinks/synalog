SELECT
  x_3 AS t,
  CARDINALITY(SPLIT(x_3, ' ')) AS n
FROM
  UNNEST(TRANSFORM(ARRAY['hello', 'a b c'], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY t;