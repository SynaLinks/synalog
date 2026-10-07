WITH t_2_P AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  P.r.home.city AS city,
  ARRAY_AGG(CAST(ROW(P.r.name) AS ROW(n varchar))) AS l
FROM
  t_2_P AS P
WHERE
  (P.r.home.city IS NOT null)
GROUP BY 1)
SELECT
  t_0_L.city AS city,
  x_3.n AS n
FROM
  t_1_L AS t_0_L, UNNEST(TRANSFORM(t_0_L.l, synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY city, n;