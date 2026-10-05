WITH t_4_HasPhone AS (SELECT * FROM (
  
    SELECT
      "a1" AS account,
      "555-1" AS phone
   UNION ALL
  
    SELECT
      "a2" AS account,
      "555-1" AS phone
   UNION ALL
  
    SELECT
      "a2" AS account,
      "555-2" AS phone
   UNION ALL
  
    SELECT
      "a3" AS account,
      "555-2" AS phone
   UNION ALL
  
    SELECT
      "a4" AS account,
      "555-3" AS phone
   UNION ALL
  
    SELECT
      "a5" AS account,
      "555-4" AS phone
   UNION ALL
  
    SELECT
      "a6" AS account,
      "555-4" AS phone
   UNION ALL
  
    SELECT
      "a7" AS account,
      "555-9" AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_2_Shares AS (SELECT
  HasPhone.account AS a,
  t_3_HasPhone.account AS b
FROM
  t_4_HasPhone AS HasPhone, t_4_HasPhone AS t_3_HasPhone
WHERE
  (HasPhone.account != t_3_HasPhone.account) AND
  (t_3_HasPhone.phone = HasPhone.phone)
GROUP BY a, b),
t_37_Linked_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_38_Shares.a AS a,
      t_38_Shares.b AS b
    FROM
      t_2_Shares AS t_38_Shares
  
) AS UNUSED_TABLE_NAME  ),
t_36_Linked_r0 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f1.a AS a,
  Linked_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_37_Linked_MultBodyAggAux_recursive_head_f1 AS Linked_MultBodyAggAux_recursive_head_f1
GROUP BY a, b),
t_33_Linked_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_34_Shares.a AS a,
      t_34_Shares.b AS b
    FROM
      t_2_Shares AS t_34_Shares
   UNION ALL
  
    SELECT
      Linked_r0.a AS a,
      t_35_Shares.b AS b
    FROM
      t_36_Linked_r0 AS Linked_r0, t_2_Shares AS t_35_Shares
    WHERE
      (t_35_Shares.a = Linked_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_32_Linked_r1 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f2.a AS a,
  Linked_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_33_Linked_MultBodyAggAux_recursive_head_f2 AS Linked_MultBodyAggAux_recursive_head_f2
GROUP BY a, b),
t_29_Linked_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_30_Shares.a AS a,
      t_30_Shares.b AS b
    FROM
      t_2_Shares AS t_30_Shares
   UNION ALL
  
    SELECT
      Linked_r1.a AS a,
      t_31_Shares.b AS b
    FROM
      t_32_Linked_r1 AS Linked_r1, t_2_Shares AS t_31_Shares
    WHERE
      (t_31_Shares.a = Linked_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_28_Linked_r2 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f3.a AS a,
  Linked_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_29_Linked_MultBodyAggAux_recursive_head_f3 AS Linked_MultBodyAggAux_recursive_head_f3
GROUP BY a, b),
t_25_Linked_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_26_Shares.a AS a,
      t_26_Shares.b AS b
    FROM
      t_2_Shares AS t_26_Shares
   UNION ALL
  
    SELECT
      Linked_r2.a AS a,
      t_27_Shares.b AS b
    FROM
      t_28_Linked_r2 AS Linked_r2, t_2_Shares AS t_27_Shares
    WHERE
      (t_27_Shares.a = Linked_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_24_Linked_r3 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f4.a AS a,
  Linked_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_25_Linked_MultBodyAggAux_recursive_head_f4 AS Linked_MultBodyAggAux_recursive_head_f4
GROUP BY a, b),
t_21_Linked_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_22_Shares.a AS a,
      t_22_Shares.b AS b
    FROM
      t_2_Shares AS t_22_Shares
   UNION ALL
  
    SELECT
      Linked_r3.a AS a,
      t_23_Shares.b AS b
    FROM
      t_24_Linked_r3 AS Linked_r3, t_2_Shares AS t_23_Shares
    WHERE
      (t_23_Shares.a = Linked_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Linked_r4 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f5.a AS a,
  Linked_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_21_Linked_MultBodyAggAux_recursive_head_f5 AS Linked_MultBodyAggAux_recursive_head_f5
GROUP BY a, b),
t_17_Linked_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_18_Shares.a AS a,
      t_18_Shares.b AS b
    FROM
      t_2_Shares AS t_18_Shares
   UNION ALL
  
    SELECT
      Linked_r4.a AS a,
      t_19_Shares.b AS b
    FROM
      t_20_Linked_r4 AS Linked_r4, t_2_Shares AS t_19_Shares
    WHERE
      (t_19_Shares.a = Linked_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Linked_r5 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f6.a AS a,
  Linked_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_17_Linked_MultBodyAggAux_recursive_head_f6 AS Linked_MultBodyAggAux_recursive_head_f6
GROUP BY a, b),
t_13_Linked_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_14_Shares.a AS a,
      t_14_Shares.b AS b
    FROM
      t_2_Shares AS t_14_Shares
   UNION ALL
  
    SELECT
      Linked_r5.a AS a,
      t_15_Shares.b AS b
    FROM
      t_16_Linked_r5 AS Linked_r5, t_2_Shares AS t_15_Shares
    WHERE
      (t_15_Shares.a = Linked_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Linked_r6 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f7.a AS a,
  Linked_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_13_Linked_MultBodyAggAux_recursive_head_f7 AS Linked_MultBodyAggAux_recursive_head_f7
GROUP BY a, b),
t_7_Linked_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_8_Shares.a AS a,
      t_8_Shares.b AS b
    FROM
      t_2_Shares AS t_8_Shares
   UNION ALL
  
    SELECT
      Linked_r6.a AS a,
      t_11_Shares.b AS b
    FROM
      t_12_Linked_r6 AS Linked_r6, t_2_Shares AS t_11_Shares
    WHERE
      (t_11_Shares.a = Linked_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_6_Linked_r7 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f8.a AS a,
  Linked_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_7_Linked_MultBodyAggAux_recursive_head_f8 AS Linked_MultBodyAggAux_recursive_head_f8
GROUP BY a, b),
t_1_Linked_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_2_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_r7.a AS a,
      t_5_Shares.b AS b
    FROM
      t_6_Linked_r7 AS Linked_r7, t_2_Shares AS t_5_Shares
    WHERE
      (t_5_Shares.a = Linked_r7.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Linked AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f9.a AS a,
  Linked_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_1_Linked_MultBodyAggAux_recursive_head_f9 AS Linked_MultBodyAggAux_recursive_head_f9
GROUP BY a, b)
SELECT
  Linked.b AS b
FROM
  t_0_Linked AS Linked
WHERE
  (Linked.b != "a3") AND
  (Linked.a = "a3")
GROUP BY b ORDER BY b;