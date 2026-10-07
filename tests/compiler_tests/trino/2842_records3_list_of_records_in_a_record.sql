WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      CAST(ROW('a', ARRAY[CAST(ROW(1) AS ROW(v double)), CAST(ROW(2) AS ROW(v double))]) AS ROW(name varchar, xs array(ROW(v double)))) AS r
   UNION ALL
  
    SELECT
      CAST(ROW('b', ARRAY[CAST(ROW(5) AS ROW(v double))]) AS ROW(name varchar, xs array(ROW(v double)))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.r.name AS name,
  x_1.v AS v
FROM
  t_1_R AS t_0_R, UNNEST(TRANSFORM(t_0_R.r.xs, synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY name, v;