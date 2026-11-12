ATTACH DATABASE ':memory:' AS synalog_home;

DROP TABLE IF EXISTS synalog_home.Users;
CREATE TABLE synalog_home.Users AS WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V;

-- Interacting with table synalog_home.Users

SELECT
  Q.x AS x
FROM
  synalog_home.Users AS Q ORDER BY x NULLS LAST;
