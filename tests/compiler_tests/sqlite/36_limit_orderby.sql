WITH t_0_Scores AS (SELECT * FROM (
  
    SELECT
      'Alice' AS col0,
      95 AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      87 AS col1
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      92 AS col1
   UNION ALL
  
    SELECT
      'Diana' AS col0,
      88 AS col1
   UNION ALL
  
    SELECT
      'Eve' AS col0,
      91 AS col1
   UNION ALL
  
    SELECT
      'Frank' AS col0,
      85 AS col1
   UNION ALL
  
    SELECT
      'Grace' AS col0,
      93 AS col1
   UNION ALL
  
    SELECT
      'Henry' AS col0,
      89 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Scores.col0 AS name,
  Scores.col1 AS score
FROM
  t_0_Scores AS Scores ORDER BY score desc LIMIT 3;