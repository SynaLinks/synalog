WITH t_24_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_23_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.y AS y
FROM
  t_24_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY 1),
t_21_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_64) + (1)) AS y
    FROM
      t_23_Reach_r0 AS Reach_r0, UNNEST(FILTER(SEQUENCE(0, 20), x -> x < 20)) as pushkin(x_64)
    WHERE
      (Reach_r0.y = x_64)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.y AS y
FROM
  t_21_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY 1),
t_18_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_56) + (1)) AS y
    FROM
      t_20_Reach_r1 AS Reach_r1, UNNEST(FILTER(SEQUENCE(0, 20), x -> x < 20)) as pushkin(x_56)
    WHERE
      (Reach_r1.y = x_56)
  
) AS UNUSED_TABLE_NAME  ),
t_17_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.y AS y
FROM
  t_18_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY 1),
t_15_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_48) + (1)) AS y
    FROM
      t_17_Reach_r2 AS Reach_r2, UNNEST(FILTER(SEQUENCE(0, 20), x -> x < 20)) as pushkin(x_48)
    WHERE
      (Reach_r2.y = x_48)
  
) AS UNUSED_TABLE_NAME  ),
t_14_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.y AS y
FROM
  t_15_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY 1),
t_12_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_40) + (1)) AS y
    FROM
      t_14_Reach_r3 AS Reach_r3, UNNEST(FILTER(SEQUENCE(0, 20), x -> x < 20)) as pushkin(x_40)
    WHERE
      (Reach_r3.y = x_40)
  
) AS UNUSED_TABLE_NAME  ),
t_11_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.y AS y
FROM
  t_12_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY 1),
t_9_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_32) + (1)) AS y
    FROM
      t_11_Reach_r4 AS Reach_r4, UNNEST(FILTER(SEQUENCE(0, 20), x -> x < 20)) as pushkin(x_32)
    WHERE
      (Reach_r4.y = x_32)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Reach_r5 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6.y AS y
FROM
  t_9_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY 1),
t_6_Reach_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_24) + (1)) AS y
    FROM
      t_8_Reach_r5 AS Reach_r5, UNNEST(FILTER(SEQUENCE(0, 20), x -> x < 20)) as pushkin(x_24)
    WHERE
      (Reach_r5.y = x_24)
  
) AS UNUSED_TABLE_NAME  ),
t_5_Reach_r6 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f7.y AS y
FROM
  t_6_Reach_MultBodyAggAux_recursive_head_f7 AS Reach_MultBodyAggAux_recursive_head_f7
GROUP BY 1),
t_3_Reach_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_16) + (1)) AS y
    FROM
      t_5_Reach_r6 AS Reach_r6, UNNEST(FILTER(SEQUENCE(0, 20), x -> x < 20)) as pushkin(x_16)
    WHERE
      (Reach_r6.y = x_16)
  
) AS UNUSED_TABLE_NAME  ),
t_2_Reach_r7 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f8.y AS y
FROM
  t_3_Reach_MultBodyAggAux_recursive_head_f8 AS Reach_MultBodyAggAux_recursive_head_f8
GROUP BY 1),
t_1_Reach_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_8) + (1)) AS y
    FROM
      t_2_Reach_r7 AS Reach_r7, UNNEST(FILTER(SEQUENCE(0, 20), x -> x < 20)) as pushkin(x_8)
    WHERE
      (Reach_r7.y = x_8)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f9.y AS y
FROM
  t_1_Reach_MultBodyAggAux_recursive_head_f9 AS Reach_MultBodyAggAux_recursive_head_f9
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;