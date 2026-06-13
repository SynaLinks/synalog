WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      'A' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'A' AS category,
      2 AS value
   UNION ALL
  
    SELECT
      'A' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'B' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'B' AS category,
      1 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_UniqueCategories AS (SELECT
  Data.category AS category
FROM
  t_1_Data AS Data
GROUP BY 1 ORDER BY category)
SELECT
  UniqueCategories.category AS category
FROM
  t_0_UniqueCategories AS UniqueCategories ORDER BY category;