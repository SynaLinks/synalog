WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      2 AS qty,
      5 AS price
   UNION ALL
  
    SELECT
      3 AS qty,
      6 AS price
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(((Line.qty) * (Line.price))) AS t
FROM
  t_0_Line AS Line;