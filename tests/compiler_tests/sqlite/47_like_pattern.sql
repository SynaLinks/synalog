WITH t_1_Names AS (SELECT * FROM (
  
    SELECT
      'alice' AS name
   UNION ALL
  
    SELECT
      'alan' AS name
   UNION ALL
  
    SELECT
      'bob' AS name
   UNION ALL
  
    SELECT
      'albert' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_0_StartsWithAl AS (SELECT
  Names.name AS name
FROM
  t_1_Names AS Names
WHERE
  (Names.name LIKE 'al%') ORDER BY name)
SELECT
  StartsWithAl.name AS name
FROM
  t_0_StartsWithAl AS StartsWithAl ORDER BY name;