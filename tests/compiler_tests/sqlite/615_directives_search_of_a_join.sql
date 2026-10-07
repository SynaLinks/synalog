WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'paris' AS c
   UNION ALL
  
    SELECT
      2 AS k,
      'lyon' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k,
  A.c AS c
FROM
  t_0_A AS A, JSON_EACH(JSON_ARRAY(1, 2)) as x_6
WHERE
  (A.k = x_6.value) ORDER BY k;