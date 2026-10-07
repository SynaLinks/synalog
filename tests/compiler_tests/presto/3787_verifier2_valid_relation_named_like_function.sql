WITH t_0_Rank AS (SELECT * FROM (
  
    SELECT
      1 AS r
   UNION ALL
  
    SELECT
      2 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Rank.r AS r
FROM
  t_0_Rank AS Rank
WHERE
  (Rank.r > 1);