DROP TABLE IF EXISTS synalog_home.synalog_home.G;
CREATE TABLE synalog_home.synalog_home.G AS SELECT
  x_1 AS k
FROM
  UNNEST(TRANSFORM(ARRAY[1], synalog_e -> ROW(synalog_e))) as pushkin(x_1);

-- Interacting with table synalog_home.synalog_home.G

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  G.k AS k,
  N.s AS s
FROM
  synalog_home.synalog_home.G AS G, t_0_N AS N
WHERE
  (N.k = G.k);