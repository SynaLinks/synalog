WITH t_0_Friend AS (SELECT * FROM (
  
    SELECT
      "a" AS a,
      "b" AS b
   UNION ALL
  
    SELECT
      "b" AS a,
      "a" AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS name
FROM
  LATERAL (SELECT explode(ARRAY("a", "b", "c")) AS x_3) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_Friend AS Friend
  WHERE
    (Friend.a = x_3)) IS NULL) ORDER BY name NULLS LAST;