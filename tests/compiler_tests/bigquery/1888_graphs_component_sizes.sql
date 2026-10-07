WITH t_2_Node AS (SELECT * FROM (
  
    SELECT
      1 AS n
   UNION ALL
  
    SELECT
      2 AS n
   UNION ALL
  
    SELECT
      3 AS n
   UNION ALL
  
    SELECT
      4 AS n
   UNION ALL
  
    SELECT
      5 AS n
   UNION ALL
  
    SELECT
      6 AS n
   UNION ALL
  
    SELECT
      7 AS n
   UNION ALL
  
    SELECT
      8 AS n
   UNION ALL
  
    SELECT
      9 AS n
   UNION ALL
  
    SELECT
      10 AS n
   UNION ALL
  
    SELECT
      11 AS n
   UNION ALL
  
    SELECT
      12 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_7_E AS (SELECT * FROM (
  
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
      1 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      6 AS b
   UNION ALL
  
    SELECT
      6 AS a,
      7 AS b
   UNION ALL
  
    SELECT
      7 AS a,
      8 AS b
   UNION ALL
  
    SELECT
      8 AS a,
      5 AS b
   UNION ALL
  
    SELECT
      9 AS a,
      10 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_6_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_7_E AS E
   UNION ALL
  
    SELECT
      t_8_E.b AS a,
      t_8_E.a AS b
    FROM
      t_7_E AS t_8_E
  
) AS UNUSED_TABLE_NAME  ),
t_5_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_6_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY a, b),
t_58_Conn_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_59_U.a AS a,
      t_59_U.b AS b
    FROM
      t_5_U AS t_59_U
  
) AS UNUSED_TABLE_NAME  ),
t_57_Conn_r0 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f1.a AS a,
  Conn_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_58_Conn_MultBodyAggAux_recursive_head_f1 AS Conn_MultBodyAggAux_recursive_head_f1
GROUP BY a, b),
t_54_Conn_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_55_U.a AS a,
      t_55_U.b AS b
    FROM
      t_5_U AS t_55_U
   UNION ALL
  
    SELECT
      Conn_r0.a AS a,
      t_56_U.b AS b
    FROM
      t_57_Conn_r0 AS Conn_r0, t_5_U AS t_56_U
    WHERE
      (t_56_U.a = Conn_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_53_Conn_r1 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f2.a AS a,
  Conn_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_54_Conn_MultBodyAggAux_recursive_head_f2 AS Conn_MultBodyAggAux_recursive_head_f2
GROUP BY a, b),
t_50_Conn_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_51_U.a AS a,
      t_51_U.b AS b
    FROM
      t_5_U AS t_51_U
   UNION ALL
  
    SELECT
      Conn_r1.a AS a,
      t_52_U.b AS b
    FROM
      t_53_Conn_r1 AS Conn_r1, t_5_U AS t_52_U
    WHERE
      (t_52_U.a = Conn_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_49_Conn_r2 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f3.a AS a,
  Conn_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_50_Conn_MultBodyAggAux_recursive_head_f3 AS Conn_MultBodyAggAux_recursive_head_f3
GROUP BY a, b),
t_46_Conn_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_47_U.a AS a,
      t_47_U.b AS b
    FROM
      t_5_U AS t_47_U
   UNION ALL
  
    SELECT
      Conn_r2.a AS a,
      t_48_U.b AS b
    FROM
      t_49_Conn_r2 AS Conn_r2, t_5_U AS t_48_U
    WHERE
      (t_48_U.a = Conn_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_45_Conn_r3 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f4.a AS a,
  Conn_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_46_Conn_MultBodyAggAux_recursive_head_f4 AS Conn_MultBodyAggAux_recursive_head_f4
GROUP BY a, b),
t_42_Conn_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_43_U.a AS a,
      t_43_U.b AS b
    FROM
      t_5_U AS t_43_U
   UNION ALL
  
    SELECT
      Conn_r3.a AS a,
      t_44_U.b AS b
    FROM
      t_45_Conn_r3 AS Conn_r3, t_5_U AS t_44_U
    WHERE
      (t_44_U.a = Conn_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_41_Conn_r4 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f5.a AS a,
  Conn_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_42_Conn_MultBodyAggAux_recursive_head_f5 AS Conn_MultBodyAggAux_recursive_head_f5
GROUP BY a, b),
t_38_Conn_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_39_U.a AS a,
      t_39_U.b AS b
    FROM
      t_5_U AS t_39_U
   UNION ALL
  
    SELECT
      Conn_r4.a AS a,
      t_40_U.b AS b
    FROM
      t_41_Conn_r4 AS Conn_r4, t_5_U AS t_40_U
    WHERE
      (t_40_U.a = Conn_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_37_Conn_r5 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f6.a AS a,
  Conn_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_38_Conn_MultBodyAggAux_recursive_head_f6 AS Conn_MultBodyAggAux_recursive_head_f6
GROUP BY a, b),
t_34_Conn_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_35_U.a AS a,
      t_35_U.b AS b
    FROM
      t_5_U AS t_35_U
   UNION ALL
  
    SELECT
      Conn_r5.a AS a,
      t_36_U.b AS b
    FROM
      t_37_Conn_r5 AS Conn_r5, t_5_U AS t_36_U
    WHERE
      (t_36_U.a = Conn_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_33_Conn_r6 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f7.a AS a,
  Conn_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_34_Conn_MultBodyAggAux_recursive_head_f7 AS Conn_MultBodyAggAux_recursive_head_f7
GROUP BY a, b),
t_30_Conn_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_31_U.a AS a,
      t_31_U.b AS b
    FROM
      t_5_U AS t_31_U
   UNION ALL
  
    SELECT
      Conn_r6.a AS a,
      t_32_U.b AS b
    FROM
      t_33_Conn_r6 AS Conn_r6, t_5_U AS t_32_U
    WHERE
      (t_32_U.a = Conn_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_29_Conn_r7 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f8.a AS a,
  Conn_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_30_Conn_MultBodyAggAux_recursive_head_f8 AS Conn_MultBodyAggAux_recursive_head_f8
GROUP BY a, b),
t_26_Conn_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_27_U.a AS a,
      t_27_U.b AS b
    FROM
      t_5_U AS t_27_U
   UNION ALL
  
    SELECT
      Conn_r7.a AS a,
      t_28_U.b AS b
    FROM
      t_29_Conn_r7 AS Conn_r7, t_5_U AS t_28_U
    WHERE
      (t_28_U.a = Conn_r7.b)
  
) AS UNUSED_TABLE_NAME  ),
t_25_Conn_r8 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f9.a AS a,
  Conn_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_26_Conn_MultBodyAggAux_recursive_head_f9 AS Conn_MultBodyAggAux_recursive_head_f9
GROUP BY a, b),
t_22_Conn_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_23_U.a AS a,
      t_23_U.b AS b
    FROM
      t_5_U AS t_23_U
   UNION ALL
  
    SELECT
      Conn_r8.a AS a,
      t_24_U.b AS b
    FROM
      t_25_Conn_r8 AS Conn_r8, t_5_U AS t_24_U
    WHERE
      (t_24_U.a = Conn_r8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_21_Conn_r9 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f10.a AS a,
  Conn_MultBodyAggAux_recursive_head_f10.b AS b
FROM
  t_22_Conn_MultBodyAggAux_recursive_head_f10 AS Conn_MultBodyAggAux_recursive_head_f10
GROUP BY a, b),
t_18_Conn_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      t_19_U.a AS a,
      t_19_U.b AS b
    FROM
      t_5_U AS t_19_U
   UNION ALL
  
    SELECT
      Conn_r9.a AS a,
      t_20_U.b AS b
    FROM
      t_21_Conn_r9 AS Conn_r9, t_5_U AS t_20_U
    WHERE
      (t_20_U.a = Conn_r9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_17_Conn_r10 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f11.a AS a,
  Conn_MultBodyAggAux_recursive_head_f11.b AS b
FROM
  t_18_Conn_MultBodyAggAux_recursive_head_f11 AS Conn_MultBodyAggAux_recursive_head_f11
GROUP BY a, b),
t_11_Conn_MultBodyAggAux_recursive_head_f12 AS (SELECT * FROM (
  
    SELECT
      t_12_U.a AS a,
      t_12_U.b AS b
    FROM
      t_5_U AS t_12_U
   UNION ALL
  
    SELECT
      Conn_r10.a AS a,
      t_16_U.b AS b
    FROM
      t_17_Conn_r10 AS Conn_r10, t_5_U AS t_16_U
    WHERE
      (t_16_U.a = Conn_r10.b)
  
) AS UNUSED_TABLE_NAME  ),
t_10_Conn_r11 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f12.a AS a,
  Conn_MultBodyAggAux_recursive_head_f12.b AS b
FROM
  t_11_Conn_MultBodyAggAux_recursive_head_f12 AS Conn_MultBodyAggAux_recursive_head_f12
GROUP BY a, b),
t_4_Conn_MultBodyAggAux_recursive_head_f13 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_5_U AS U
   UNION ALL
  
    SELECT
      Conn_r11.a AS a,
      t_9_U.b AS b
    FROM
      t_10_Conn_r11 AS Conn_r11, t_5_U AS t_9_U
    WHERE
      (t_9_U.a = Conn_r11.b)
  
) AS UNUSED_TABLE_NAME  ),
t_3_Conn AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f13.a AS a,
  Conn_MultBodyAggAux_recursive_head_f13.b AS b
FROM
  t_4_Conn_MultBodyAggAux_recursive_head_f13 AS Conn_MultBodyAggAux_recursive_head_f13
GROUP BY a, b),
t_1_Comp_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Node.n AS n,
      Conn.b AS c
    FROM
      t_2_Node AS Node, t_3_Conn AS Conn
    WHERE
      (Conn.a = Node.n)
   UNION ALL
  
    SELECT
      t_61_Node.n AS n,
      t_61_Node.n AS c
    FROM
      t_2_Node AS t_61_Node
  
) AS UNUSED_TABLE_NAME  ),
t_0_Comp AS (SELECT
  Comp_MultBodyAggAux.n AS n,
  MIN(Comp_MultBodyAggAux.c) AS c
FROM
  t_1_Comp_MultBodyAggAux AS Comp_MultBodyAggAux
GROUP BY n)
SELECT
  Comp.c AS c,
  SUM(1) AS size
FROM
  t_0_Comp AS Comp
GROUP BY c ORDER BY c, size;