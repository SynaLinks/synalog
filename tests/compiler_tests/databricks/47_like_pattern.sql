WITH t_1_Names AS (SELECT * FROM VALUES
  ("alice"),
  ("alan"),
  ("bob"),
  ("albert")
AS UNUSED_TABLE_NAME(name)),
t_0_StartsWithAl AS (SELECT
  Names.name AS name
FROM
  t_1_Names AS Names
WHERE
  (CAST(Names.name AS STRING) LIKE "al%") ORDER BY name NULLS LAST)
SELECT
  StartsWithAl.name AS name
FROM
  t_0_StartsWithAl AS StartsWithAl ORDER BY name NULLS LAST;