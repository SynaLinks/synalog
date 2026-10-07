WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      UNNEST(ARRAY[0, 1]) as x_4
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      UNNEST(ARRAY[2, 3]) as x_6
   UNION ALL
  
    SELECT
      x_8 AS x
    FROM
      UNNEST(ARRAY[4, 5]) as x_8
   UNION ALL
  
    SELECT
      x_10 AS x
    FROM
      UNNEST(ARRAY[6, 7]) as x_10
   UNION ALL
  
    SELECT
      x_12 AS x
    FROM
      UNNEST(ARRAY[8, 9]) as x_12
   UNION ALL
  
    SELECT
      x_14 AS x
    FROM
      UNNEST(ARRAY[10, 11]) as x_14
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY x)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;