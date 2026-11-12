DROP TABLE IF EXISTS synalog_home.Users;
CREATE TABLE synalog_home.Users AS WITH t_0_V AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(x))
SELECT
  V.x AS x
FROM
  t_0_V AS V;

-- Interacting with table synalog_home.Users

SELECT
  Q.x AS x
FROM
  synalog_home.Users AS Q ORDER BY x NULLS LAST;
