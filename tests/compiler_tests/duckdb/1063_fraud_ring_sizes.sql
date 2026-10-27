-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_6_HasPhone AS (SELECT * FROM (
  
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
  (t_10_HasPhone.account IS DISTINCT FROM t_11_HasPhone.account) AND
  (t_11_HasPhone.phone IS NOT DISTINCT FROM t_10_HasPhone.phone)
GROUP BY t_10_HasPhone.account, t_11_HasPhone.account),
t_8_Linked_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Shares.a AS a,
        Shares.b AS b,
        0 AS synalog_step
      FROM
        t_9_Shares AS Shares
     UNION ALL
    
      SELECT
        t_14_Shares.a AS a,
        t_12_Shares.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_9_Shares AS t_14_Shares, t_9_Shares AS t_12_Shares
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_12_Shares.a IS NOT DISTINCT FROM t_14_Shares.b)
     UNION ALL
    
      SELECT
        t_22_Shares.a AS a,
        t_18_Shares.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_9_Shares AS t_22_Shares, t_9_Shares AS t_20_Shares, t_9_Shares AS t_18_Shares
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_18_Shares.a IS NOT DISTINCT FROM t_20_Shares.b) AND
        (t_20_Shares.a IS NOT DISTINCT FROM t_22_Shares.b)
     UNION ALL
    
      SELECT
        t_30_Shares.a AS a,
        t_24_Shares.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_9_Shares AS t_30_Shares, t_9_Shares AS t_28_Shares, t_9_Shares AS t_26_Shares, t_9_Shares AS t_24_Shares
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_24_Shares.a IS NOT DISTINCT FROM t_26_Shares.b) AND
        (t_26_Shares.a IS NOT DISTINCT FROM t_28_Shares.b) AND
        (t_28_Shares.a IS NOT DISTINCT FROM t_30_Shares.b)
     UNION ALL
    
      SELECT
        t_40_Shares.a AS a,
        t_32_Shares.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_9_Shares AS t_40_Shares, t_9_Shares AS t_38_Shares, t_9_Shares AS t_36_Shares, t_9_Shares AS t_34_Shares, t_9_Shares AS t_32_Shares
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_32_Shares.a IS NOT DISTINCT FROM t_34_Shares.b) AND
        (t_34_Shares.a IS NOT DISTINCT FROM t_36_Shares.b) AND
        (t_36_Shares.a IS NOT DISTINCT FROM t_38_Shares.b) AND
        (t_38_Shares.a IS NOT DISTINCT FROM t_40_Shares.b)
     UNION ALL
    
      SELECT
        t_52_Shares.a AS a,
        t_42_Shares.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_9_Shares AS t_52_Shares, t_9_Shares AS t_50_Shares, t_9_Shares AS t_48_Shares, t_9_Shares AS t_46_Shares, t_9_Shares AS t_44_Shares, t_9_Shares AS t_42_Shares
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_42_Shares.a IS NOT DISTINCT FROM t_44_Shares.b) AND
        (t_44_Shares.a IS NOT DISTINCT FROM t_46_Shares.b) AND
        (t_46_Shares.a IS NOT DISTINCT FROM t_48_Shares.b) AND
        (t_48_Shares.a IS NOT DISTINCT FROM t_50_Shares.b) AND
        (t_50_Shares.a IS NOT DISTINCT FROM t_52_Shares.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_53_Linked_RecursiveCte.a AS a,
  t_54_Shares.b AS b,
  ((t_53_Linked_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_8_Linked_RecursiveCte AS t_53_Linked_RecursiveCte, t_9_Shares AS t_54_Shares
WHERE
  (t_53_Linked_RecursiveCte.synalog_step < 8) AND
  (t_54_Shares.a IS NOT DISTINCT FROM t_53_Linked_RecursiveCte.b)),
t_7_Linked AS (SELECT
  Linked_RecursiveCte.a AS a,
  Linked_RecursiveCte.b AS b
FROM
  t_8_Linked_RecursiveCte AS Linked_RecursiveCte
GROUP BY Linked_RecursiveCte.a, Linked_RecursiveCte.b),
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
GROUP BY t_0_Root.root ORDER BY root;