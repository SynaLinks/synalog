DROP TABLE IF EXISTS synalog_test.G;
CREATE TABLE synalog_test.G AS WITH t_0_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s))
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