WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;