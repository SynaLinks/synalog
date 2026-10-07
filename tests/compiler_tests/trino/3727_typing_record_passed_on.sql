WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      CAST(ROW('a', 1.5E0, ARRAY['x']) AS ROW(name varchar, score double, tags array(varchar))) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(ROW('b', null, ARRAY[]) AS ROW(name varchar, score double, tags array(varchar))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.id AS id,
  P.r.name AS name,
  CARDINALITY(P.r.tags) AS n,
  P.r.score AS s
FROM
  t_0_P AS P ORDER BY id;