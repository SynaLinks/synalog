SELECT * FROM (
  
    SELECT
      ((1) * (2)) AS z
   UNION ALL
  
    SELECT
      ((5) * (2)) AS z
  
) AS UNUSED_TABLE_NAME  ORDER BY z ;