DROP TABLE IF EXISTS logica_test.W;
CREATE TABLE logica_test.W AS WITH t_0_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      UNNEST(ARRAY[0, 1]) as pushkin(x_4)
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      UNNEST(ARRAY[2, 3]) as pushkin(x_6)
  
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