DROP TABLE IF EXISTS synalog_test.G;
CREATE TABLE synalog_test.G AS SELECT
  x_1 AS k
FROM
  UNNEST(ARRAY[1]) as x_1;

-- Interacting with table synalog_test.G

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      "a" AS s
   UNION ALL
  
    SELECT
      2 AS k,
      "b" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  G.k AS k,
  N.s AS s
FROM
  synalog_test.G AS G, t_0_N AS N
WHERE
  (N.k IS NOT DISTINCT FROM G.k);