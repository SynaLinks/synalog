SELECT
  x_3 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'b'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_3 = 'a')) IS NULL);