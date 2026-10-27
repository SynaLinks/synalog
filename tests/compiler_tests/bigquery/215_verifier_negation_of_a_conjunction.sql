WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_3
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_0_B AS B
  WHERE
    (B.x IS NOT DISTINCT FROM x_3) AND
    (x_3 = 2)) IS NULL) ORDER BY x NULLS LAST;