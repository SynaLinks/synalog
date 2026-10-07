WITH t_1_Events1 AS (SELECT * FROM VALUES
  ("A", 10),
  ("A", 20),
  ("B", 15)
AS UNUSED_TABLE_NAME(category, count)),
t_0_Total1 AS (SELECT
  Events1.category AS category,
  SUM(Events1.count) AS total
FROM
  t_1_Events1 AS Events1
GROUP BY 1),
t_1_Events2 AS (SELECT * FROM VALUES
  ("B", 5),
  ("C", 25),
  ("C", 30)
AS UNUSED_TABLE_NAME(category, count)),
t_0_Total2 AS (SELECT
  Events2.category AS category,
  SUM(Events2.count) AS total
FROM
  t_1_Events2 AS Events2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      "events1" AS source,
      Total1.category AS category,
      Total1.total AS total
    FROM
      t_0_Total1 AS Total1
   UNION ALL
  
    SELECT
      "events2" AS source,
      Total2.category AS category,
      Total2.total AS total
    FROM
      t_0_Total2 AS Total2
  
) AS UNUSED_TABLE_NAME  ORDER BY source NULLS LAST, category NULLS LAST ;