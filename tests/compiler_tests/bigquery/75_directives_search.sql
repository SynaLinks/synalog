SELECT * FROM (
  
    SELECT
      "rome" AS name,
      1 AS n
   UNION ALL
  
    SELECT
      "paris" AS name,
      2 AS n
   UNION ALL
  
    SELECT
      "oslo" AS name,
      10 AS n
  
) AS UNUSED_TABLE_NAME  ORDER BY name ;