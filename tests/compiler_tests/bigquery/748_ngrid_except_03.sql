WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_X AS t_0_X
  WHERE
    (t_0_X.x = x_3)) IS NULL) ORDER BY x NULLS LAST;