WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.x AS x
FROM
  t_0_A AS A
WHERE
  (A.x = 1) ORDER BY x;