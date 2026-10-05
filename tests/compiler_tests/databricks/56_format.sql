WITH t_1_Items AS (SELECT * FROM VALUES
  ("apple", 5),
  ("pear", 2)
AS UNUSED_TABLE_NAME(name, qty)),
t_0_Labels AS (SELECT
  Items.name AS name,
  FORMAT_STRING("%s x%s", Items.name, CAST(Items.qty AS STRING)) AS label
FROM
  t_1_Items AS Items ORDER BY name NULLS LAST)
SELECT
  Labels.name AS name,
  Labels.label AS label
FROM
  t_0_Labels AS Labels ORDER BY name NULLS LAST;