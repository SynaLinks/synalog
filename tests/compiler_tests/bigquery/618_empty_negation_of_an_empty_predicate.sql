SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    UNNEST(ARRAY[1]) as x_6
  WHERE
    (x_6 > 5) AND
    (x_3 IS NOT DISTINCT FROM x_6)) IS NULL) ORDER BY x NULLS LAST;