WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "ann" AS name,
      10 AS dept,
      null AS boss
   UNION ALL
  
    SELECT
      2 AS id,
      "bob" AS name,
      10 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      3 AS id,
      "cid" AS name,
      20 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      4 AS id,
      "dee" AS name,
      null AS dept,
      2 AS boss
   UNION ALL
  
    SELECT
      5 AS id,
      "eve" AS name,
      30 AS dept,
      3 AS boss
   UNION ALL
  
    SELECT
      6 AS id,
      "fay" AS name,
      20 AS dept,
      null AS boss
  
) AS UNUSED_TABLE_NAME  ),
t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "sql" AS skill
   UNION ALL
  
    SELECT
      1 AS id,
      "go" AS skill
   UNION ALL
  
    SELECT
      2 AS id,
      "sql" AS skill
   UNION ALL
  
    SELECT
      3 AS id,
      "rust" AS skill
   UNION ALL
  
    SELECT
      5 AS id,
      "sql" AS skill
   UNION ALL
  
    SELECT
      5 AS id,
      "go" AS skill
   UNION ALL
  
    SELECT
      6 AS id,
      "excel" AS skill
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.name AS name
FROM
  t_0_E AS E, t_1_S AS S
WHERE
  (S.id = E.id) AND
  (S.skill = "sql") ORDER BY name;