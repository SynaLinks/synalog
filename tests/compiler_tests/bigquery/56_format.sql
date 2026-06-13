WITH t_1_Items AS (SELECT * FROM (
  
    SELECT
      "apple" AS name,
      5 AS qty
   UNION ALL
  
    SELECT
      "pear" AS name,
      2 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_0_Labels AS (SELECT
  Items.name AS name,
  FORMAT("%s x%s", Items.name, CAST(Items.qty AS STRING)) AS label
FROM
  t_1_Items AS Items ORDER BY name)
SELECT
  Labels.name AS name,
  Labels.label AS label
FROM
  t_0_Labels AS Labels ORDER BY name;