WITH t_0_BigNumbers AS (SELECT
  x_5 AS x
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 10), x -> x < 10), synalog_e -> ROW(synalog_e))) as pushkin(x_5)
WHERE
  (x_5 > 5) ORDER BY x)
SELECT
  BigNumbers.x AS x
FROM
  t_0_BigNumbers AS BigNumbers ORDER BY x;