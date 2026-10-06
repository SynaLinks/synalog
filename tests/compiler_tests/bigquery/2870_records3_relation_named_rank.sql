WITH t_0_Rank AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Rank.x AS x
FROM
  t_0_Rank AS Rank ORDER BY x;