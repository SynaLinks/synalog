WITH t_0_D AS (SELECT
  x_4 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'a '], synalog_e -> ROW(synalog_e))) as pushkin(x_4)
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;