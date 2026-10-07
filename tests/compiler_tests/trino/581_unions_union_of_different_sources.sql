WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      'b' AS t
   UNION ALL
  
    SELECT
      'c' AS t
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      'a' AS s
   UNION ALL
  
    SELECT
      B.t AS s
    FROM
      t_0_B AS B
  
) AS UNUSED_TABLE_NAME  ORDER BY s ;