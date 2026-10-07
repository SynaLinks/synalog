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
  x_4 AS t
FROM
  t_1_R AS t_0_R, UNNEST(TRANSFORM(t_0_R.r.tags, synalog_e -> ROW(synalog_e))) as pushkin(x_4) ORDER BY id, t;