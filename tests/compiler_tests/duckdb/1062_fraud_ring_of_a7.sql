-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_4_HasPhone AS (SELECT * FROM (
  
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
t_2_Shares AS (SELECT
  HasPhone.account AS a,
  t_3_HasPhone.account AS b
FROM
  t_4_HasPhone AS HasPhone, t_4_HasPhone AS t_3_HasPhone
WHERE
  (HasPhone.account IS DISTINCT FROM t_3_HasPhone.account) AND
  (t_3_HasPhone.phone IS NOT DISTINCT FROM HasPhone.phone)
GROUP BY HasPhone.account, t_3_HasPhone.account),
t_1_Linked_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Shares.a AS a,
        Shares.b AS b,
        0 AS synalog_step
      FROM
        t_2_Shares AS Shares
     UNION ALL
    
      SELECT
        t_7_Shares.a AS a,
        t_5_Shares.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Shares AS t_7_Shares, t_2_Shares AS t_5_Shares
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_5_Shares.a IS NOT DISTINCT FROM t_7_Shares.b)
     UNION ALL
    
      SELECT
        t_15_Shares.a AS a,
        t_11_Shares.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Shares AS t_15_Shares, t_2_Shares AS t_13_Shares, t_2_Shares AS t_11_Shares
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_11_Shares.a IS NOT DISTINCT FROM t_13_Shares.b) AND
        (t_13_Shares.a IS NOT DISTINCT FROM t_15_Shares.b)
     UNION ALL
    
      SELECT
        t_23_Shares.a AS a,
        t_17_Shares.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Shares AS t_23_Shares, t_2_Shares AS t_21_Shares, t_2_Shares AS t_19_Shares, t_2_Shares AS t_17_Shares
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_17_Shares.a IS NOT DISTINCT FROM t_19_Shares.b) AND
        (t_19_Shares.a IS NOT DISTINCT FROM t_21_Shares.b) AND
        (t_21_Shares.a IS NOT DISTINCT FROM t_23_Shares.b)
     UNION ALL
    
      SELECT
        t_33_Shares.a AS a,
        t_25_Shares.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Shares AS t_33_Shares, t_2_Shares AS t_31_Shares, t_2_Shares AS t_29_Shares, t_2_Shares AS t_27_Shares, t_2_Shares AS t_25_Shares
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_25_Shares.a IS NOT DISTINCT FROM t_27_Shares.b) AND
        (t_27_Shares.a IS NOT DISTINCT FROM t_29_Shares.b) AND
        (t_29_Shares.a IS NOT DISTINCT FROM t_31_Shares.b) AND
        (t_31_Shares.a IS NOT DISTINCT FROM t_33_Shares.b)
     UNION ALL
    
      SELECT
        t_45_Shares.a AS a,
        t_35_Shares.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Shares AS t_45_Shares, t_2_Shares AS t_43_Shares, t_2_Shares AS t_41_Shares, t_2_Shares AS t_39_Shares, t_2_Shares AS t_37_Shares, t_2_Shares AS t_35_Shares
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_35_Shares.a IS NOT DISTINCT FROM t_37_Shares.b) AND
        (t_37_Shares.a IS NOT DISTINCT FROM t_39_Shares.b) AND
        (t_39_Shares.a IS NOT DISTINCT FROM t_41_Shares.b) AND
        (t_41_Shares.a IS NOT DISTINCT FROM t_43_Shares.b) AND
        (t_43_Shares.a IS NOT DISTINCT FROM t_45_Shares.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_46_Linked_RecursiveCte.a AS a,
  t_47_Shares.b AS b,
  ((t_46_Linked_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Linked_RecursiveCte AS t_46_Linked_RecursiveCte, t_2_Shares AS t_47_Shares
WHERE
  (t_46_Linked_RecursiveCte.synalog_step < 8) AND
  (t_47_Shares.a IS NOT DISTINCT FROM t_46_Linked_RecursiveCte.b)),
t_0_Linked AS (SELECT
  Linked_RecursiveCte.a AS a,
  Linked_RecursiveCte.b AS b
FROM
  t_1_Linked_RecursiveCte AS Linked_RecursiveCte
GROUP BY Linked_RecursiveCte.a, Linked_RecursiveCte.b)
SELECT
  Linked.b AS b
FROM
  t_0_Linked AS Linked
WHERE
  (Linked.b IS DISTINCT FROM 'a7') AND
  (Linked.a = 'a7')
GROUP BY Linked.b ORDER BY b;