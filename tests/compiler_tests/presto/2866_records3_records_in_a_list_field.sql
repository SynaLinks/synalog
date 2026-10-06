WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      CAST(ROW(ARRAY[CAST(ROW('p') AS ROW(n varchar)), CAST(ROW('q') AS ROW(n varchar))], 'a') AS ROW(items array(ROW(n varchar)), name varchar)) AS r
   UNION ALL
  
    SELECT
      CAST(ROW(ARRAY[CAST(ROW('r') AS ROW(n varchar))], 'b') AS ROW(items array(ROW(n varchar)), name varchar)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.r.name AS name,
  x_1.n AS item
FROM
  t_0_T AS T, UNNEST(TRANSFORM(T.r.items, synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY name, item;