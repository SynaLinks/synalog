-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_0_Flagged AS (SELECT * FROM (
  
    SELECT
      'a1' AS account
   UNION ALL
  
    SELECT
      'a5' AS account
  
) AS UNUSED_TABLE_NAME  ),
t_5_HasPhone AS (SELECT * FROM (
  
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
t_3_Shares AS (SELECT
  HasPhone.account AS a,
  t_4_HasPhone.account AS b
FROM
  t_5_HasPhone AS HasPhone, t_5_HasPhone AS t_4_HasPhone
WHERE
  (HasPhone.account IS DISTINCT FROM t_4_HasPhone.account) AND
  (t_4_HasPhone.phone IS NOT DISTINCT FROM HasPhone.phone)
GROUP BY HasPhone.account, t_4_HasPhone.account),
t_2_Linked_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Shares.a AS a,
        Shares.b AS b,
        0 AS synalog_step
      FROM
        t_3_Shares AS Shares
     UNION ALL
    
      SELECT
        t_8_Shares.a AS a,
        t_6_Shares.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_Shares AS t_8_Shares, t_3_Shares AS t_6_Shares
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_6_Shares.a IS NOT DISTINCT FROM t_8_Shares.b)
     UNION ALL
    
      SELECT
        t_16_Shares.a AS a,
        t_12_Shares.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Shares AS t_16_Shares, t_3_Shares AS t_14_Shares, t_3_Shares AS t_12_Shares
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_12_Shares.a IS NOT DISTINCT FROM t_14_Shares.b) AND
        (t_14_Shares.a IS NOT DISTINCT FROM t_16_Shares.b)
     UNION ALL
    
      SELECT
        t_24_Shares.a AS a,
        t_18_Shares.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Shares AS t_24_Shares, t_3_Shares AS t_22_Shares, t_3_Shares AS t_20_Shares, t_3_Shares AS t_18_Shares
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_18_Shares.a IS NOT DISTINCT FROM t_20_Shares.b) AND
        (t_20_Shares.a IS NOT DISTINCT FROM t_22_Shares.b) AND
        (t_22_Shares.a IS NOT DISTINCT FROM t_24_Shares.b)
     UNION ALL
    
      SELECT
        t_34_Shares.a AS a,
        t_26_Shares.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Shares AS t_34_Shares, t_3_Shares AS t_32_Shares, t_3_Shares AS t_30_Shares, t_3_Shares AS t_28_Shares, t_3_Shares AS t_26_Shares
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_26_Shares.a IS NOT DISTINCT FROM t_28_Shares.b) AND
        (t_28_Shares.a IS NOT DISTINCT FROM t_30_Shares.b) AND
        (t_30_Shares.a IS NOT DISTINCT FROM t_32_Shares.b) AND
        (t_32_Shares.a IS NOT DISTINCT FROM t_34_Shares.b)
     UNION ALL
    
      SELECT
        t_46_Shares.a AS a,
        t_36_Shares.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Shares AS t_46_Shares, t_3_Shares AS t_44_Shares, t_3_Shares AS t_42_Shares, t_3_Shares AS t_40_Shares, t_3_Shares AS t_38_Shares, t_3_Shares AS t_36_Shares
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_36_Shares.a IS NOT DISTINCT FROM t_38_Shares.b) AND
        (t_38_Shares.a IS NOT DISTINCT FROM t_40_Shares.b) AND
        (t_40_Shares.a IS NOT DISTINCT FROM t_42_Shares.b) AND
        (t_42_Shares.a IS NOT DISTINCT FROM t_44_Shares.b) AND
        (t_44_Shares.a IS NOT DISTINCT FROM t_46_Shares.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_47_Linked_RecursiveCte.a AS a,
  t_48_Shares.b AS b,
  ((t_47_Linked_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_Linked_RecursiveCte AS t_47_Linked_RecursiveCte, t_3_Shares AS t_48_Shares
WHERE
  (t_47_Linked_RecursiveCte.synalog_step < 8) AND
  (t_48_Shares.a IS NOT DISTINCT FROM t_47_Linked_RecursiveCte.b)),
t_1_Linked AS (SELECT
  Linked_RecursiveCte.a AS a,
  Linked_RecursiveCte.b AS b
FROM
  t_2_Linked_RecursiveCte AS Linked_RecursiveCte
GROUP BY Linked_RecursiveCte.a, Linked_RecursiveCte.b)
SELECT
  Linked.b AS account
FROM
  t_0_Flagged AS Flagged, t_1_Linked AS Linked
WHERE
  ((SELECT
    MIN((CASE WHEN x_224.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_Flagged AS t_49_Flagged, (select unnest([0]) as unnested_pod) as x_224
  WHERE
    (t_49_Flagged.account IS NOT DISTINCT FROM Linked.b)) IS NULL) AND
  (Linked.a IS NOT DISTINCT FROM Flagged.account)
GROUP BY Linked.b ORDER BY account;