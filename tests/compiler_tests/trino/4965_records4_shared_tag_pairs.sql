WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      CAST(ROW(31, CAST(ROW('paris') AS ROW(city varchar)), 'ann', ARRAY['a', 'b']) AS ROW(age double, home ROW(city varchar), name varchar, tags array(varchar))) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(ROW(null, CAST(ROW('oslo') AS ROW(city varchar)), 'bob', ARRAY[]) AS ROW(age double, home ROW(city varchar), name varchar, tags array(varchar))) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      CAST(ROW(45, CAST(ROW('paris') AS ROW(city varchar)), 'cid', ARRAY['c']) AS ROW(age double, home ROW(city varchar), name varchar, tags array(varchar))) AS r
   UNION ALL
  
    SELECT
      4 AS id,
      CAST(ROW(22, CAST(ROW(null) AS ROW(city varchar)), 'dee', ARRAY['a']) AS ROW(age double, home ROW(city varchar), name varchar, tags array(varchar))) AS r
   UNION ALL
  
    SELECT
      5 AS id,
      CAST(ROW(38, CAST(ROW('rome') AS ROW(city varchar)), 'eve', ARRAY['b', 'c', 'd']) AS ROW(age double, home ROW(city varchar), name varchar, tags array(varchar))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.id AS a,
  t_0_P.id AS b
FROM
  t_1_P AS P, t_1_P AS t_0_P, UNNEST(TRANSFORM(P.r.tags, synalog_e -> ROW(synalog_e))) as pushkin(x_6), UNNEST(TRANSFORM(t_0_P.r.tags, synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  (P.id < t_0_P.id) AND
  (x_6 = x_7)
GROUP BY 1, 2 ORDER BY a, b;