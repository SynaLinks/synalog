-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
  (COALESCE(t_3_HasPhone.phone, '') = COALESCE(HasPhone.phone, '') AND (t_3_HasPhone.phone IS NULL) = (HasPhone.phone IS NULL))
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
        (COALESCE(t_5_Shares.a, '') = COALESCE(t_7_Shares.b, '') AND (t_5_Shares.a IS NULL) = (t_7_Shares.b IS NULL))
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
        (COALESCE(t_11_Shares.a, '') = COALESCE(t_13_Shares.b, '') AND (t_11_Shares.a IS NULL) = (t_13_Shares.b IS NULL)) AND
        (COALESCE(t_13_Shares.a, '') = COALESCE(t_15_Shares.b, '') AND (t_13_Shares.a IS NULL) = (t_15_Shares.b IS NULL))
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
        (COALESCE(t_17_Shares.a, '') = COALESCE(t_19_Shares.b, '') AND (t_17_Shares.a IS NULL) = (t_19_Shares.b IS NULL)) AND
        (COALESCE(t_19_Shares.a, '') = COALESCE(t_21_Shares.b, '') AND (t_19_Shares.a IS NULL) = (t_21_Shares.b IS NULL)) AND
        (COALESCE(t_21_Shares.a, '') = COALESCE(t_23_Shares.b, '') AND (t_21_Shares.a IS NULL) = (t_23_Shares.b IS NULL))
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
        (COALESCE(t_25_Shares.a, '') = COALESCE(t_27_Shares.b, '') AND (t_25_Shares.a IS NULL) = (t_27_Shares.b IS NULL)) AND
        (COALESCE(t_27_Shares.a, '') = COALESCE(t_29_Shares.b, '') AND (t_27_Shares.a IS NULL) = (t_29_Shares.b IS NULL)) AND
        (COALESCE(t_29_Shares.a, '') = COALESCE(t_31_Shares.b, '') AND (t_29_Shares.a IS NULL) = (t_31_Shares.b IS NULL)) AND
        (COALESCE(t_31_Shares.a, '') = COALESCE(t_33_Shares.b, '') AND (t_31_Shares.a IS NULL) = (t_33_Shares.b IS NULL))
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
        (COALESCE(t_35_Shares.a, '') = COALESCE(t_37_Shares.b, '') AND (t_35_Shares.a IS NULL) = (t_37_Shares.b IS NULL)) AND
        (COALESCE(t_37_Shares.a, '') = COALESCE(t_39_Shares.b, '') AND (t_37_Shares.a IS NULL) = (t_39_Shares.b IS NULL)) AND
        (COALESCE(t_39_Shares.a, '') = COALESCE(t_41_Shares.b, '') AND (t_39_Shares.a IS NULL) = (t_41_Shares.b IS NULL)) AND
        (COALESCE(t_41_Shares.a, '') = COALESCE(t_43_Shares.b, '') AND (t_41_Shares.a IS NULL) = (t_43_Shares.b IS NULL)) AND
        (COALESCE(t_43_Shares.a, '') = COALESCE(t_45_Shares.b, '') AND (t_43_Shares.a IS NULL) = (t_45_Shares.b IS NULL))
    
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
  (COALESCE(t_47_Shares.a, '') = COALESCE(t_46_Linked_RecursiveCte.b, '') AND (t_47_Shares.a IS NULL) = (t_46_Linked_RecursiveCte.b IS NULL))),
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
  (Linked.b IS DISTINCT FROM 'a4') AND
  (Linked.a = 'a4')
GROUP BY Linked.b ORDER BY b;