WITH t_6_HasPhone AS (SELECT * FROM (
  
    SELECT
      'a1' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a3' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a4' AS account,
      '555-3' AS phone
   UNION ALL
  
    SELECT
      'a5' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a6' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a7' AS account,
      '555-9' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_5_Account AS (SELECT
  HasPhone.account AS account
FROM
  t_6_HasPhone AS HasPhone
GROUP BY HasPhone.account),
t_9_Shares AS (SELECT
  t_10_HasPhone.account AS a,
  t_11_HasPhone.account AS b
FROM
  t_6_HasPhone AS t_10_HasPhone, t_6_HasPhone AS t_11_HasPhone
WHERE
  (t_10_HasPhone.account != t_11_HasPhone.account) AND
  (t_11_HasPhone.phone = t_10_HasPhone.phone)
GROUP BY t_10_HasPhone.account, t_11_HasPhone.account),
t_44_Linked_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_45_Shares.a AS a,
      t_45_Shares.b AS b
    FROM
      t_9_Shares AS t_45_Shares
  
) AS UNUSED_TABLE_NAME  ),
t_43_Linked_r0 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f1.a AS a,
  Linked_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_44_Linked_MultBodyAggAux_recursive_head_f1 AS Linked_MultBodyAggAux_recursive_head_f1
GROUP BY Linked_MultBodyAggAux_recursive_head_f1.a, Linked_MultBodyAggAux_recursive_head_f1.b),
t_40_Linked_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_41_Shares.a AS a,
      t_41_Shares.b AS b
    FROM
      t_9_Shares AS t_41_Shares
   UNION ALL
  
    SELECT
      Linked_r0.a AS a,
      t_42_Shares.b AS b
    FROM
      t_43_Linked_r0 AS Linked_r0, t_9_Shares AS t_42_Shares
    WHERE
      (t_42_Shares.a = Linked_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_39_Linked_r1 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f2.a AS a,
  Linked_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_40_Linked_MultBodyAggAux_recursive_head_f2 AS Linked_MultBodyAggAux_recursive_head_f2
GROUP BY Linked_MultBodyAggAux_recursive_head_f2.a, Linked_MultBodyAggAux_recursive_head_f2.b),
t_36_Linked_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_37_Shares.a AS a,
      t_37_Shares.b AS b
    FROM
      t_9_Shares AS t_37_Shares
   UNION ALL
  
    SELECT
      Linked_r1.a AS a,
      t_38_Shares.b AS b
    FROM
      t_39_Linked_r1 AS Linked_r1, t_9_Shares AS t_38_Shares
    WHERE
      (t_38_Shares.a = Linked_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_35_Linked_r2 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f3.a AS a,
  Linked_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_36_Linked_MultBodyAggAux_recursive_head_f3 AS Linked_MultBodyAggAux_recursive_head_f3
GROUP BY Linked_MultBodyAggAux_recursive_head_f3.a, Linked_MultBodyAggAux_recursive_head_f3.b),
t_32_Linked_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_33_Shares.a AS a,
      t_33_Shares.b AS b
    FROM
      t_9_Shares AS t_33_Shares
   UNION ALL
  
    SELECT
      Linked_r2.a AS a,
      t_34_Shares.b AS b
    FROM
      t_35_Linked_r2 AS Linked_r2, t_9_Shares AS t_34_Shares
    WHERE
      (t_34_Shares.a = Linked_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_31_Linked_r3 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f4.a AS a,
  Linked_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_32_Linked_MultBodyAggAux_recursive_head_f4 AS Linked_MultBodyAggAux_recursive_head_f4
GROUP BY Linked_MultBodyAggAux_recursive_head_f4.a, Linked_MultBodyAggAux_recursive_head_f4.b),
t_28_Linked_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_29_Shares.a AS a,
      t_29_Shares.b AS b
    FROM
      t_9_Shares AS t_29_Shares
   UNION ALL
  
    SELECT
      Linked_r3.a AS a,
      t_30_Shares.b AS b
    FROM
      t_31_Linked_r3 AS Linked_r3, t_9_Shares AS t_30_Shares
    WHERE
      (t_30_Shares.a = Linked_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_27_Linked_r4 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f5.a AS a,
  Linked_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_28_Linked_MultBodyAggAux_recursive_head_f5 AS Linked_MultBodyAggAux_recursive_head_f5
GROUP BY Linked_MultBodyAggAux_recursive_head_f5.a, Linked_MultBodyAggAux_recursive_head_f5.b),
t_24_Linked_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_25_Shares.a AS a,
      t_25_Shares.b AS b
    FROM
      t_9_Shares AS t_25_Shares
   UNION ALL
  
    SELECT
      Linked_r4.a AS a,
      t_26_Shares.b AS b
    FROM
      t_27_Linked_r4 AS Linked_r4, t_9_Shares AS t_26_Shares
    WHERE
      (t_26_Shares.a = Linked_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_23_Linked_r5 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f6.a AS a,
  Linked_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_24_Linked_MultBodyAggAux_recursive_head_f6 AS Linked_MultBodyAggAux_recursive_head_f6
GROUP BY Linked_MultBodyAggAux_recursive_head_f6.a, Linked_MultBodyAggAux_recursive_head_f6.b),
t_20_Linked_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_21_Shares.a AS a,
      t_21_Shares.b AS b
    FROM
      t_9_Shares AS t_21_Shares
   UNION ALL
  
    SELECT
      Linked_r5.a AS a,
      t_22_Shares.b AS b
    FROM
      t_23_Linked_r5 AS Linked_r5, t_9_Shares AS t_22_Shares
    WHERE
      (t_22_Shares.a = Linked_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_19_Linked_r6 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f7.a AS a,
  Linked_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_20_Linked_MultBodyAggAux_recursive_head_f7 AS Linked_MultBodyAggAux_recursive_head_f7
GROUP BY Linked_MultBodyAggAux_recursive_head_f7.a, Linked_MultBodyAggAux_recursive_head_f7.b),
t_14_Linked_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_15_Shares.a AS a,
      t_15_Shares.b AS b
    FROM
      t_9_Shares AS t_15_Shares
   UNION ALL
  
    SELECT
      Linked_r6.a AS a,
      t_18_Shares.b AS b
    FROM
      t_19_Linked_r6 AS Linked_r6, t_9_Shares AS t_18_Shares
    WHERE
      (t_18_Shares.a = Linked_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_13_Linked_r7 AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f8.a AS a,
  Linked_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_14_Linked_MultBodyAggAux_recursive_head_f8 AS Linked_MultBodyAggAux_recursive_head_f8
GROUP BY Linked_MultBodyAggAux_recursive_head_f8.a, Linked_MultBodyAggAux_recursive_head_f8.b),
t_8_Linked_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      Shares.a AS a,
      Shares.b AS b
    FROM
      t_9_Shares AS Shares
   UNION ALL
  
    SELECT
      Linked_r7.a AS a,
      t_12_Shares.b AS b
    FROM
      t_13_Linked_r7 AS Linked_r7, t_9_Shares AS t_12_Shares
    WHERE
      (t_12_Shares.a = Linked_r7.b)
  
) AS UNUSED_TABLE_NAME  ),
t_7_Linked AS (SELECT
  Linked_MultBodyAggAux_recursive_head_f9.a AS a,
  Linked_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_8_Linked_MultBodyAggAux_recursive_head_f9 AS Linked_MultBodyAggAux_recursive_head_f9
GROUP BY Linked_MultBodyAggAux_recursive_head_f9.a, Linked_MultBodyAggAux_recursive_head_f9.b),
t_3_Member_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_4_Account.account AS account,
      t_4_Account.account AS other
    FROM
      t_5_Account AS t_4_Account
   UNION ALL
  
    SELECT
      Linked.a AS account,
      Linked.b AS other
    FROM
      t_7_Linked AS Linked
  
) AS UNUSED_TABLE_NAME  ),
t_2_Member AS (SELECT
  Member_MultBodyAggAux.account AS account,
  Member_MultBodyAggAux.other AS other
FROM
  t_3_Member_MultBodyAggAux AS Member_MultBodyAggAux
GROUP BY Member_MultBodyAggAux.account, Member_MultBodyAggAux.other),
t_1_Root AS (SELECT
  Member.account AS account,
  MIN(Member.other) AS root
FROM
  t_2_Member AS Member
GROUP BY Member.account)
SELECT
  t_0_Root.root AS root,
  SUM(1) AS n
FROM
  t_1_Root AS t_0_Root
GROUP BY t_0_Root.root ORDER BY root NULLS LAST;