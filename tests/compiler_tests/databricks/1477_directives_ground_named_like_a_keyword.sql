DROP TABLE IF EXISTS synalog_home.Order_table;
CREATE TABLE synalog_home.Order_table AS WITH t_0_V AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(x))
SELECT
  V.x AS x
FROM
  t_0_V AS V;

-- Interacting with table synalog_home.Order_table

SELECT
  t_0_Order.x AS x
FROM
  synalog_home.Order_table AS t_0_Order ORDER BY x NULLS LAST;
