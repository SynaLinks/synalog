SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    UNNEST(ARRAY[1, 2]) as x_8
  WHERE
    (x_3 > 5) AND
    (x_3 < 3) AND
    (x_3 IS NOT DISTINCT FROM x_8)) IS NULL) ORDER BY x NULLS LAST;