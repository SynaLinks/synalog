DROP TABLE IF EXISTS logica_test.W;
CREATE TABLE logica_test.W AS WITH t_0_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[0, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
   UNION ALL
  
    SELECT
      x_5 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_5)
   UNION ALL
  
    SELECT
      x_7 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[4, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_7)
   UNION ALL
  
    SELECT
      x_9 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[6, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_9)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_0_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1;

-- Interacting with table logica_test.W

SELECT
  SUM(1) AS n
FROM
  logica_test.W AS W;