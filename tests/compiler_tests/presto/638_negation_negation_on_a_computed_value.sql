SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_8)
  WHERE
    ((MOD(x_3, NULLIF(2, 0))) = 0) AND
    (x_3 IS NOT DISTINCT FROM x_8)) IS NULL) ORDER BY x;