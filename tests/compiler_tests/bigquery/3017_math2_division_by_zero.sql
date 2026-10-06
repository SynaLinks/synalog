WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      2 AS id,
      0 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      3 AS id,
      7.5 AS x,
      2 AS z
   UNION ALL
  
    SELECT
      4 AS id,
      -7.5 AS x,
      2 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.id AS id,
  ((t_0_V.x) / NULLIF(t_0_V.z, 0)) AS v
FROM
  t_1_V AS t_0_V ORDER BY id NULLS LAST;