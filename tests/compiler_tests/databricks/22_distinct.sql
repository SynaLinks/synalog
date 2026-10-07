WITH t_1_Data AS (SELECT * FROM VALUES
  ("A", 1),
  ("A", 2),
  ("A", 1),
  ("B", 1),
  ("B", 1)
AS UNUSED_TABLE_NAME(category, value)),
t_0_UniqueCategories AS (SELECT
  Data.category AS category
FROM
  t_1_Data AS Data
GROUP BY 1 ORDER BY category NULLS LAST)
SELECT
  UniqueCategories.category AS category
FROM
  t_0_UniqueCategories AS UniqueCategories ORDER BY category NULLS LAST;