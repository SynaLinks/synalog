WITH t_0_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      2 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      3 AS col1
   UNION ALL
  
    SELECT
      3 AS col0,
      4 AS col1
   UNION ALL
  
    SELECT
      4 AS col0,
      5 AS col1
   UNION ALL
  
    SELECT
      1 AS col0,
      3 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Edge.col0 AS src,
  Edge.col1 AS dst
FROM
  t_0_Edge AS Edge ORDER BY src, dst;