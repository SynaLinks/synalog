WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      x_6.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2)) as x_6
   UNION ALL
  
    SELECT
      'b' AS src,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.src AS src,
  SUM(1) AS n
FROM
  t_0_S AS S
GROUP BY S.src ORDER BY src;