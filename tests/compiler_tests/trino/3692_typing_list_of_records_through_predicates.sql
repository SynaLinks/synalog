WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS v
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(CAST(ROW(t_2_V.n, t_2_V.v) AS ROW(n varchar, v double))) AS l
FROM
  t_3_V AS t_2_V)
SELECT
  x_1.n AS n,
  x_1.v AS v
FROM
  t_1_L AS t_0_L, UNNEST(TRANSFORM(t_0_L.l, synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY n;