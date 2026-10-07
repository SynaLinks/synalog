SELECT
  x_3 AS w,
  SUBSTR(x_3, ((LENGTH(x_3)) - (1)), 2) AS l
FROM
  UNNEST(TRANSFORM(ARRAY['Apple', 'kiwi', 'Banana'], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY w;