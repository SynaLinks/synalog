DROP TABLE IF EXISTS synalog_test.Users;
CREATE TABLE synalog_test.Users AS WITH t_0_V AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(x))
SELECT
  V.x AS x
FROM
  t_0_V AS V;

-- Interacting with table synalog_test.Users

SELECT
  Q.x AS x
FROM
  synalog_test.Users AS Q ORDER BY x NULLS LAST;
