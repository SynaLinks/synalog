WITH t_3_C AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'c' AS c
   UNION ALL
  
    SELECT
      2 AS k,
      'd' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_2_C.k AS k,
  'a' AS a,
  'b' AS b,
  t_2_C.c AS c
FROM
  t_3_C AS t_2_C
WHERE
  (1 = t_2_C.k) AND
  (1 = t_2_C.k);