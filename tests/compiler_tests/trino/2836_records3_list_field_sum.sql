WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(ROW('a', ARRAY[1, 2, 3]) AS ROW(name varchar, xs array(double))) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(ROW('b', ARRAY[4]) AS ROW(name varchar, xs array(double))) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      CAST(ROW('c', ARRAY[]) AS ROW(name varchar, xs array(double))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.r.name AS name,
  SUM(x_1) AS t
FROM
  t_0_S AS S, UNNEST(TRANSFORM(S.r.xs, synalog_e -> ROW(synalog_e))) as pushkin(x_1)
GROUP BY 1 ORDER BY name;