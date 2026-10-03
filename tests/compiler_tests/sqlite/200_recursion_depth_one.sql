WITH t_2_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_2_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY Reach_MultBodyAggAux_recursive_head_f1.x ORDER BY x),
t_4_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      Edge.b AS x
    FROM
      t_1_Reach_r0 AS Reach_r0, t_4_Edge AS Edge
    WHERE
      (Edge.a = Reach_r0.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_0_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY Reach_MultBodyAggAux_recursive_head_f2.x ORDER BY x;