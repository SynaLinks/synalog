WITH t_3_Node AS (SELECT * FROM (
  
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
t_8_E AS (SELECT * FROM (
  
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
t_7_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_8_E AS E
   UNION ALL
  
    SELECT
      t_9_E.b AS a,
      t_9_E.a AS b
    FROM
      t_8_E AS t_9_E
  
) AS UNUSED_TABLE_NAME  ),
t_6_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_7_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.a, U_MultBodyAggAux.b),
t_59_Conn_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_60_U.a AS a,
      t_60_U.b AS b
    FROM
      t_6_U AS t_60_U
  
) AS UNUSED_TABLE_NAME  ),
t_58_Conn_r0 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f1.a AS a,
  Conn_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_59_Conn_MultBodyAggAux_recursive_head_f1 AS Conn_MultBodyAggAux_recursive_head_f1
GROUP BY Conn_MultBodyAggAux_recursive_head_f1.a, Conn_MultBodyAggAux_recursive_head_f1.b),
t_55_Conn_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_56_U.a AS a,
      t_56_U.b AS b
    FROM
      t_6_U AS t_56_U
   UNION ALL
  
    SELECT
      Conn_r0.a AS a,
      t_57_U.b AS b
    FROM
      t_58_Conn_r0 AS Conn_r0, t_6_U AS t_57_U
    WHERE
      (t_57_U.a = Conn_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_54_Conn_r1 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f2.a AS a,
  Conn_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_55_Conn_MultBodyAggAux_recursive_head_f2 AS Conn_MultBodyAggAux_recursive_head_f2
GROUP BY Conn_MultBodyAggAux_recursive_head_f2.a, Conn_MultBodyAggAux_recursive_head_f2.b),
t_51_Conn_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_52_U.a AS a,
      t_52_U.b AS b
    FROM
      t_6_U AS t_52_U
   UNION ALL
  
    SELECT
      Conn_r1.a AS a,
      t_53_U.b AS b
    FROM
      t_54_Conn_r1 AS Conn_r1, t_6_U AS t_53_U
    WHERE
      (t_53_U.a = Conn_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_50_Conn_r2 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f3.a AS a,
  Conn_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_51_Conn_MultBodyAggAux_recursive_head_f3 AS Conn_MultBodyAggAux_recursive_head_f3
GROUP BY Conn_MultBodyAggAux_recursive_head_f3.a, Conn_MultBodyAggAux_recursive_head_f3.b),
t_47_Conn_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_48_U.a AS a,
      t_48_U.b AS b
    FROM
      t_6_U AS t_48_U
   UNION ALL
  
    SELECT
      Conn_r2.a AS a,
      t_49_U.b AS b
    FROM
      t_50_Conn_r2 AS Conn_r2, t_6_U AS t_49_U
    WHERE
      (t_49_U.a = Conn_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_46_Conn_r3 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f4.a AS a,
  Conn_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_47_Conn_MultBodyAggAux_recursive_head_f4 AS Conn_MultBodyAggAux_recursive_head_f4
GROUP BY Conn_MultBodyAggAux_recursive_head_f4.a, Conn_MultBodyAggAux_recursive_head_f4.b),
t_43_Conn_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_44_U.a AS a,
      t_44_U.b AS b
    FROM
      t_6_U AS t_44_U
   UNION ALL
  
    SELECT
      Conn_r3.a AS a,
      t_45_U.b AS b
    FROM
      t_46_Conn_r3 AS Conn_r3, t_6_U AS t_45_U
    WHERE
      (t_45_U.a = Conn_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_42_Conn_r4 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f5.a AS a,
  Conn_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_43_Conn_MultBodyAggAux_recursive_head_f5 AS Conn_MultBodyAggAux_recursive_head_f5
GROUP BY Conn_MultBodyAggAux_recursive_head_f5.a, Conn_MultBodyAggAux_recursive_head_f5.b),
t_39_Conn_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_40_U.a AS a,
      t_40_U.b AS b
    FROM
      t_6_U AS t_40_U
   UNION ALL
  
    SELECT
      Conn_r4.a AS a,
      t_41_U.b AS b
    FROM
      t_42_Conn_r4 AS Conn_r4, t_6_U AS t_41_U
    WHERE
      (t_41_U.a = Conn_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_38_Conn_r5 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f6.a AS a,
  Conn_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_39_Conn_MultBodyAggAux_recursive_head_f6 AS Conn_MultBodyAggAux_recursive_head_f6
GROUP BY Conn_MultBodyAggAux_recursive_head_f6.a, Conn_MultBodyAggAux_recursive_head_f6.b),
t_35_Conn_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_36_U.a AS a,
      t_36_U.b AS b
    FROM
      t_6_U AS t_36_U
   UNION ALL
  
    SELECT
      Conn_r5.a AS a,
      t_37_U.b AS b
    FROM
      t_38_Conn_r5 AS Conn_r5, t_6_U AS t_37_U
    WHERE
      (t_37_U.a = Conn_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_34_Conn_r6 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f7.a AS a,
  Conn_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_35_Conn_MultBodyAggAux_recursive_head_f7 AS Conn_MultBodyAggAux_recursive_head_f7
GROUP BY Conn_MultBodyAggAux_recursive_head_f7.a, Conn_MultBodyAggAux_recursive_head_f7.b),
t_31_Conn_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_32_U.a AS a,
      t_32_U.b AS b
    FROM
      t_6_U AS t_32_U
   UNION ALL
  
    SELECT
      Conn_r6.a AS a,
      t_33_U.b AS b
    FROM
      t_34_Conn_r6 AS Conn_r6, t_6_U AS t_33_U
    WHERE
      (t_33_U.a = Conn_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_30_Conn_r7 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f8.a AS a,
  Conn_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_31_Conn_MultBodyAggAux_recursive_head_f8 AS Conn_MultBodyAggAux_recursive_head_f8
GROUP BY Conn_MultBodyAggAux_recursive_head_f8.a, Conn_MultBodyAggAux_recursive_head_f8.b),
t_27_Conn_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_28_U.a AS a,
      t_28_U.b AS b
    FROM
      t_6_U AS t_28_U
   UNION ALL
  
    SELECT
      Conn_r7.a AS a,
      t_29_U.b AS b
    FROM
      t_30_Conn_r7 AS Conn_r7, t_6_U AS t_29_U
    WHERE
      (t_29_U.a = Conn_r7.b)
  
) AS UNUSED_TABLE_NAME  ),
t_26_Conn_r8 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f9.a AS a,
  Conn_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_27_Conn_MultBodyAggAux_recursive_head_f9 AS Conn_MultBodyAggAux_recursive_head_f9
GROUP BY Conn_MultBodyAggAux_recursive_head_f9.a, Conn_MultBodyAggAux_recursive_head_f9.b),
t_23_Conn_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_24_U.a AS a,
      t_24_U.b AS b
    FROM
      t_6_U AS t_24_U
   UNION ALL
  
    SELECT
      Conn_r8.a AS a,
      t_25_U.b AS b
    FROM
      t_26_Conn_r8 AS Conn_r8, t_6_U AS t_25_U
    WHERE
      (t_25_U.a = Conn_r8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_22_Conn_r9 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f10.a AS a,
  Conn_MultBodyAggAux_recursive_head_f10.b AS b
FROM
  t_23_Conn_MultBodyAggAux_recursive_head_f10 AS Conn_MultBodyAggAux_recursive_head_f10
GROUP BY Conn_MultBodyAggAux_recursive_head_f10.a, Conn_MultBodyAggAux_recursive_head_f10.b),
t_19_Conn_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      t_20_U.a AS a,
      t_20_U.b AS b
    FROM
      t_6_U AS t_20_U
   UNION ALL
  
    SELECT
      Conn_r9.a AS a,
      t_21_U.b AS b
    FROM
      t_22_Conn_r9 AS Conn_r9, t_6_U AS t_21_U
    WHERE
      (t_21_U.a = Conn_r9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_18_Conn_r10 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f11.a AS a,
  Conn_MultBodyAggAux_recursive_head_f11.b AS b
FROM
  t_19_Conn_MultBodyAggAux_recursive_head_f11 AS Conn_MultBodyAggAux_recursive_head_f11
GROUP BY Conn_MultBodyAggAux_recursive_head_f11.a, Conn_MultBodyAggAux_recursive_head_f11.b),
t_12_Conn_MultBodyAggAux_recursive_head_f12 AS (SELECT * FROM (
  
    SELECT
      t_13_U.a AS a,
      t_13_U.b AS b
    FROM
      t_6_U AS t_13_U
   UNION ALL
  
    SELECT
      Conn_r10.a AS a,
      t_17_U.b AS b
    FROM
      t_18_Conn_r10 AS Conn_r10, t_6_U AS t_17_U
    WHERE
      (t_17_U.a = Conn_r10.b)
  
) AS UNUSED_TABLE_NAME  ),
t_11_Conn_r11 AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f12.a AS a,
  Conn_MultBodyAggAux_recursive_head_f12.b AS b
FROM
  t_12_Conn_MultBodyAggAux_recursive_head_f12 AS Conn_MultBodyAggAux_recursive_head_f12
GROUP BY Conn_MultBodyAggAux_recursive_head_f12.a, Conn_MultBodyAggAux_recursive_head_f12.b),
t_5_Conn_MultBodyAggAux_recursive_head_f13 AS (SELECT * FROM (
  
    SELECT
      U.a AS a,
      U.b AS b
    FROM
      t_6_U AS U
   UNION ALL
  
    SELECT
      Conn_r11.a AS a,
      t_10_U.b AS b
    FROM
      t_11_Conn_r11 AS Conn_r11, t_6_U AS t_10_U
    WHERE
      (t_10_U.a = Conn_r11.b)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Conn AS (SELECT
  Conn_MultBodyAggAux_recursive_head_f13.a AS a,
  Conn_MultBodyAggAux_recursive_head_f13.b AS b
FROM
  t_5_Conn_MultBodyAggAux_recursive_head_f13 AS Conn_MultBodyAggAux_recursive_head_f13
GROUP BY Conn_MultBodyAggAux_recursive_head_f13.a, Conn_MultBodyAggAux_recursive_head_f13.b),
t_2_Comp_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Node.n AS n,
      Conn.b AS c
    FROM
      t_3_Node AS Node, t_4_Conn AS Conn
    WHERE
      (Conn.a = Node.n)
   UNION ALL
  
    SELECT
      t_62_Node.n AS n,
      t_62_Node.n AS c
    FROM
      t_3_Node AS t_62_Node
  
) AS UNUSED_TABLE_NAME  ),
t_1_Comp AS (SELECT
  Comp_MultBodyAggAux.n AS n,
  MIN(Comp_MultBodyAggAux.c) AS c
FROM
  t_2_Comp_MultBodyAggAux AS Comp_MultBodyAggAux
GROUP BY Comp_MultBodyAggAux.n)
SELECT
  t_0_Comp.n AS m
FROM
  t_1_Comp AS Comp, t_1_Comp AS t_0_Comp
WHERE
  (Comp.n = 12) AND
  (t_0_Comp.c = Comp.c);