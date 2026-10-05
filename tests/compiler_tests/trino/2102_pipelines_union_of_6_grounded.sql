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
   UNION ALL
  
    SELECT
      x_8 AS x
    FROM
      UNNEST(ARRAY[4, 5]) as pushkin(x_8)
   UNION ALL
  
    SELECT
      x_10 AS x
    FROM
      UNNEST(ARRAY[6, 7]) as pushkin(x_10)
   UNION ALL
  
    SELECT
      x_12 AS x
    FROM
      UNNEST(ARRAY[8, 9]) as pushkin(x_12)
   UNION ALL
  
    SELECT
      x_14 AS x
    FROM
      UNNEST(ARRAY[10, 11]) as pushkin(x_14)
  
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