WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      STRUCT("a" AS name, ARRAY("x") AS tags, 1.5E0 AS score) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      STRUCT("b" AS name, ARRAY() AS tags, null AS score) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.id AS id,
  P.r.name AS name,
  ARRAY_SIZE(P.r.tags) AS n,
  P.r.score AS s
FROM
  t_0_P AS P ORDER BY id NULLS LAST;