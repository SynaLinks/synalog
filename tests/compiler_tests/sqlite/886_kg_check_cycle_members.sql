WITH t_27_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_24_Anc_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_26_ParentOf.parent_id AS a,
      t_26_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_26_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_23_Anc_r0 AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f1.a AS a,
  Anc_MultBodyAggAux_recursive_head_f1.d AS d
FROM
  t_24_Anc_MultBodyAggAux_recursive_head_f1 AS Anc_MultBodyAggAux_recursive_head_f1
GROUP BY Anc_MultBodyAggAux_recursive_head_f1.a, Anc_MultBodyAggAux_recursive_head_f1.d),
t_21_Anc_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Anc_r0.a AS a,
      t_22_ParentOf.child_id AS d
    FROM
      t_23_Anc_r0 AS Anc_r0, t_27_ParentOf AS t_22_ParentOf
    WHERE
      (t_22_ParentOf.parent_id = Anc_r0.d)
   UNION ALL
  
    SELECT
      t_28_ParentOf.parent_id AS a,
      t_28_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_28_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_20_Anc_r1 AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f2.a AS a,
  Anc_MultBodyAggAux_recursive_head_f2.d AS d
FROM
  t_21_Anc_MultBodyAggAux_recursive_head_f2 AS Anc_MultBodyAggAux_recursive_head_f2
GROUP BY Anc_MultBodyAggAux_recursive_head_f2.a, Anc_MultBodyAggAux_recursive_head_f2.d),
t_18_Anc_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Anc_r1.a AS a,
      t_19_ParentOf.child_id AS d
    FROM
      t_20_Anc_r1 AS Anc_r1, t_27_ParentOf AS t_19_ParentOf
    WHERE
      (t_19_ParentOf.parent_id = Anc_r1.d)
   UNION ALL
  
    SELECT
      t_29_ParentOf.parent_id AS a,
      t_29_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_29_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_17_Anc_r2 AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f3.a AS a,
  Anc_MultBodyAggAux_recursive_head_f3.d AS d
FROM
  t_18_Anc_MultBodyAggAux_recursive_head_f3 AS Anc_MultBodyAggAux_recursive_head_f3
GROUP BY Anc_MultBodyAggAux_recursive_head_f3.a, Anc_MultBodyAggAux_recursive_head_f3.d),
t_15_Anc_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Anc_r2.a AS a,
      t_16_ParentOf.child_id AS d
    FROM
      t_17_Anc_r2 AS Anc_r2, t_27_ParentOf AS t_16_ParentOf
    WHERE
      (t_16_ParentOf.parent_id = Anc_r2.d)
   UNION ALL
  
    SELECT
      t_30_ParentOf.parent_id AS a,
      t_30_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_30_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_14_Anc_r3 AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f4.a AS a,
  Anc_MultBodyAggAux_recursive_head_f4.d AS d
FROM
  t_15_Anc_MultBodyAggAux_recursive_head_f4 AS Anc_MultBodyAggAux_recursive_head_f4
GROUP BY Anc_MultBodyAggAux_recursive_head_f4.a, Anc_MultBodyAggAux_recursive_head_f4.d),
t_12_Anc_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Anc_r3.a AS a,
      t_13_ParentOf.child_id AS d
    FROM
      t_14_Anc_r3 AS Anc_r3, t_27_ParentOf AS t_13_ParentOf
    WHERE
      (t_13_ParentOf.parent_id = Anc_r3.d)
   UNION ALL
  
    SELECT
      t_31_ParentOf.parent_id AS a,
      t_31_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_31_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_11_Anc_r4 AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f5.a AS a,
  Anc_MultBodyAggAux_recursive_head_f5.d AS d
FROM
  t_12_Anc_MultBodyAggAux_recursive_head_f5 AS Anc_MultBodyAggAux_recursive_head_f5
GROUP BY Anc_MultBodyAggAux_recursive_head_f5.a, Anc_MultBodyAggAux_recursive_head_f5.d),
t_9_Anc_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Anc_r4.a AS a,
      t_10_ParentOf.child_id AS d
    FROM
      t_11_Anc_r4 AS Anc_r4, t_27_ParentOf AS t_10_ParentOf
    WHERE
      (t_10_ParentOf.parent_id = Anc_r4.d)
   UNION ALL
  
    SELECT
      t_32_ParentOf.parent_id AS a,
      t_32_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_32_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_8_Anc_r5 AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f6.a AS a,
  Anc_MultBodyAggAux_recursive_head_f6.d AS d
FROM
  t_9_Anc_MultBodyAggAux_recursive_head_f6 AS Anc_MultBodyAggAux_recursive_head_f6
GROUP BY Anc_MultBodyAggAux_recursive_head_f6.a, Anc_MultBodyAggAux_recursive_head_f6.d),
t_6_Anc_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Anc_r5.a AS a,
      t_7_ParentOf.child_id AS d
    FROM
      t_8_Anc_r5 AS Anc_r5, t_27_ParentOf AS t_7_ParentOf
    WHERE
      (t_7_ParentOf.parent_id = Anc_r5.d)
   UNION ALL
  
    SELECT
      t_33_ParentOf.parent_id AS a,
      t_33_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_33_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_5_Anc_r6 AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f7.a AS a,
  Anc_MultBodyAggAux_recursive_head_f7.d AS d
FROM
  t_6_Anc_MultBodyAggAux_recursive_head_f7 AS Anc_MultBodyAggAux_recursive_head_f7
GROUP BY Anc_MultBodyAggAux_recursive_head_f7.a, Anc_MultBodyAggAux_recursive_head_f7.d),
t_3_Anc_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      Anc_r6.a AS a,
      t_4_ParentOf.child_id AS d
    FROM
      t_5_Anc_r6 AS Anc_r6, t_27_ParentOf AS t_4_ParentOf
    WHERE
      (t_4_ParentOf.parent_id = Anc_r6.d)
   UNION ALL
  
    SELECT
      t_34_ParentOf.parent_id AS a,
      t_34_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_34_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_2_Anc_r7 AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f8.a AS a,
  Anc_MultBodyAggAux_recursive_head_f8.d AS d
FROM
  t_3_Anc_MultBodyAggAux_recursive_head_f8 AS Anc_MultBodyAggAux_recursive_head_f8
GROUP BY Anc_MultBodyAggAux_recursive_head_f8.a, Anc_MultBodyAggAux_recursive_head_f8.d),
t_1_Anc_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      Anc_r7.a AS a,
      ParentOf.child_id AS d
    FROM
      t_2_Anc_r7 AS Anc_r7, t_27_ParentOf AS ParentOf
    WHERE
      (ParentOf.parent_id = Anc_r7.d)
   UNION ALL
  
    SELECT
      t_35_ParentOf.parent_id AS a,
      t_35_ParentOf.child_id AS d
    FROM
      t_27_ParentOf AS t_35_ParentOf
  
) AS UNUSED_TABLE_NAME  ),
t_0_Anc AS (SELECT
  Anc_MultBodyAggAux_recursive_head_f9.a AS a,
  Anc_MultBodyAggAux_recursive_head_f9.d AS d
FROM
  t_1_Anc_MultBodyAggAux_recursive_head_f9 AS Anc_MultBodyAggAux_recursive_head_f9
GROUP BY Anc_MultBodyAggAux_recursive_head_f9.a, Anc_MultBodyAggAux_recursive_head_f9.d)
SELECT
  Anc.a AS n
FROM
  t_0_Anc AS Anc
WHERE
  (Anc.d = Anc.a)
GROUP BY Anc.a ORDER BY n;