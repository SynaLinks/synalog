DROP TABLE IF EXISTS synalog_test.G;
CREATE TABLE synalog_test.G AS WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.n AS n
FROM
  t_0_N AS N
WHERE
  (N.n > 1);

-- Interacting with table synalog_test.G

SELECT
  SUM(1) AS c
FROM
  synalog_test.G AS G;