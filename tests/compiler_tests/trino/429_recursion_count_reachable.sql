WITH t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_21_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_22_E.a AS s,
      t_22_E.b AS t
    FROM
      t_2_E AS t_22_E
  
) AS UNUSED_TABLE_NAME  ),
t_20_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.s AS s,
  Reach_MultBodyAggAux_recursive_head_f1.t AS t
FROM
  t_21_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY 1, 2),
t_17_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_18_E.a AS s,
      t_18_E.b AS t
    FROM
      t_2_E AS t_18_E
   UNION ALL
  
    SELECT
      Reach_r0.s AS s,
      t_19_E.b AS t
    FROM
      t_20_Reach_r0 AS Reach_r0, t_2_E AS t_19_E
    WHERE
      (t_19_E.a = Reach_r0.t)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.s AS s,
  Reach_MultBodyAggAux_recursive_head_f2.t AS t
FROM
  t_17_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY 1, 2),
t_13_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_14_E.a AS s,
      t_14_E.b AS t
    FROM
      t_2_E AS t_14_E
   UNION ALL
  
    SELECT
      Reach_r1.s AS s,
      t_15_E.b AS t
    FROM
      t_16_Reach_r1 AS Reach_r1, t_2_E AS t_15_E
    WHERE
      (t_15_E.a = Reach_r1.t)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.s AS s,
  Reach_MultBodyAggAux_recursive_head_f3.t AS t
FROM
  t_13_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY 1, 2),
t_9_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_10_E.a AS s,
      t_10_E.b AS t
    FROM
      t_2_E AS t_10_E
   UNION ALL
  
    SELECT
      Reach_r2.s AS s,
      t_11_E.b AS t
    FROM
      t_12_Reach_r2 AS Reach_r2, t_2_E AS t_11_E
    WHERE
      (t_11_E.a = Reach_r2.t)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.s AS s,
  Reach_MultBodyAggAux_recursive_head_f4.t AS t
FROM
  t_9_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY 1, 2),
t_5_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_6_E.a AS s,
      t_6_E.b AS t
    FROM
      t_2_E AS t_6_E
   UNION ALL
  
    SELECT
      Reach_r3.s AS s,
      t_7_E.b AS t
    FROM
      t_8_Reach_r3 AS Reach_r3, t_2_E AS t_7_E
    WHERE
      (t_7_E.a = Reach_r3.t)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.s AS s,
  Reach_MultBodyAggAux_recursive_head_f5.t AS t
FROM
  t_5_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY 1, 2),
t_1_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      E.a AS s,
      E.b AS t
    FROM
      t_2_E AS E
   UNION ALL
  
    SELECT
      Reach_r4.s AS s,
      t_3_E.b AS t
    FROM
      t_4_Reach_r4 AS Reach_r4, t_2_E AS t_3_E
    WHERE
      (t_3_E.a = Reach_r4.t)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6.s AS s,
  Reach_MultBodyAggAux_recursive_head_f6.t AS t
FROM
  t_1_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY 1, 2)
SELECT
  Reach.s AS s,
  SUM(1) AS n
FROM
  t_0_Reach AS Reach
GROUP BY 1 ORDER BY s;