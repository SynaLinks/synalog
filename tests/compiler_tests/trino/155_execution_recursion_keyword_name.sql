WITH t_16_Select_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_15_Select_r0 AS (SELECT
  Select_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_16_Select_MultBodyAggAux_recursive_head_f1 AS Select_MultBodyAggAux_recursive_head_f1
GROUP BY 1),
t_18_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_13_Select_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_14_Edge.b AS x
    FROM
      t_15_Select_r0 AS Select_r0, t_18_Edge AS t_14_Edge
    WHERE
      (t_14_Edge.a = Select_r0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Select_r1 AS (SELECT
  Select_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_13_Select_MultBodyAggAux_recursive_head_f2 AS Select_MultBodyAggAux_recursive_head_f2
GROUP BY 1),
t_10_Select_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_11_Edge.b AS x
    FROM
      t_12_Select_r1 AS Select_r1, t_18_Edge AS t_11_Edge
    WHERE
      (t_11_Edge.a = Select_r1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_9_Select_r2 AS (SELECT
  Select_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_10_Select_MultBodyAggAux_recursive_head_f3 AS Select_MultBodyAggAux_recursive_head_f3
GROUP BY 1),
t_7_Select_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_8_Edge.b AS x
    FROM
      t_9_Select_r2 AS Select_r2, t_18_Edge AS t_8_Edge
    WHERE
      (t_8_Edge.a = Select_r2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_6_Select_r3 AS (SELECT
  Select_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_7_Select_MultBodyAggAux_recursive_head_f4 AS Select_MultBodyAggAux_recursive_head_f4
GROUP BY 1),
t_4_Select_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_5_Edge.b AS x
    FROM
      t_6_Select_r3 AS Select_r3, t_18_Edge AS t_5_Edge
    WHERE
      (t_5_Edge.a = Select_r3.x)
  
) AS UNUSED_TABLE_NAME  ),
t_3_Select_r4 AS (SELECT
  Select_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_4_Select_MultBodyAggAux_recursive_head_f5 AS Select_MultBodyAggAux_recursive_head_f5
GROUP BY 1),
t_2_Select_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      t_3_Select_r4 AS Select_r4, t_18_Edge AS Edge
    WHERE
      (Edge.a = Select_r4.x)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Select AS (SELECT
  Select_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_2_Select_MultBodyAggAux_recursive_head_f6 AS Select_MultBodyAggAux_recursive_head_f6
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_1_Select AS t_0_Select;