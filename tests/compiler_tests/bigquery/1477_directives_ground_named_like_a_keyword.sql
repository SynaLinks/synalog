DROP TABLE IF EXISTS logica_test.Order_table;
CREATE TABLE logica_test.Order_table AS WITH t_0_V AS (SELECT * FROM (
  
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

-- Interacting with table logica_test.Order_table

SELECT
  t_0_Order.x AS x
FROM
  logica_test.Order_table AS t_0_Order ORDER BY x NULLS LAST;
