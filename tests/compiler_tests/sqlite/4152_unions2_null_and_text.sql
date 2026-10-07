WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS s
   UNION ALL
  
    SELECT
      x_6.value AS k,
      CASE WHEN (x_6.value = 2) THEN 'b' ELSE 'c' END AS s
    FROM
      JSON_EACH(JSON_ARRAY(2, 3)) as x_6
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.k AS k,
  U.s AS s
FROM
  t_0_U AS U ORDER BY k;