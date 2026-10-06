WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      CAST(ROW('a', ARRAY['x', 'y']) AS ROW(name varchar, tags array(varchar))) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(ROW('b', ARRAY[]) AS ROW(name varchar, tags array(varchar))) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      CAST(ROW('c', ARRAY['y']) AS ROW(name varchar, tags array(varchar))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  CARDINALITY(t_0_R.r.tags) AS n
FROM
  t_1_R AS t_0_R ORDER BY id, n;