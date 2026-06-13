WITH t_0_Data AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      'Alice' AS col1,
      'alice@example.com' AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'Bob' AS col1,
      null AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      null AS col1,
      'charlie@example.com' AS col2
   UNION ALL
  
    SELECT
      4 AS col0,
      null AS col1,
      null AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Data.col0 AS id,
  COALESCE(Data.col1, 'Unknown') AS display_name
FROM
  t_0_Data AS Data ORDER BY id;