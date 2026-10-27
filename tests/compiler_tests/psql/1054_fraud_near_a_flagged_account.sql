-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
  (COALESCE(t_4_HasPhone.phone, '') = COALESCE(HasPhone.phone, '') AND (t_4_HasPhone.phone IS NULL) = (HasPhone.phone IS NULL))
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
        (COALESCE(t_6_Shares.a, '') = COALESCE(t_8_Shares.b, '') AND (t_6_Shares.a IS NULL) = (t_8_Shares.b IS NULL))
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
        (COALESCE(t_12_Shares.a, '') = COALESCE(t_14_Shares.b, '') AND (t_12_Shares.a IS NULL) = (t_14_Shares.b IS NULL)) AND
        (COALESCE(t_14_Shares.a, '') = COALESCE(t_16_Shares.b, '') AND (t_14_Shares.a IS NULL) = (t_16_Shares.b IS NULL))
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
        (COALESCE(t_18_Shares.a, '') = COALESCE(t_20_Shares.b, '') AND (t_18_Shares.a IS NULL) = (t_20_Shares.b IS NULL)) AND
        (COALESCE(t_20_Shares.a, '') = COALESCE(t_22_Shares.b, '') AND (t_20_Shares.a IS NULL) = (t_22_Shares.b IS NULL)) AND
        (COALESCE(t_22_Shares.a, '') = COALESCE(t_24_Shares.b, '') AND (t_22_Shares.a IS NULL) = (t_24_Shares.b IS NULL))
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
        (COALESCE(t_26_Shares.a, '') = COALESCE(t_28_Shares.b, '') AND (t_26_Shares.a IS NULL) = (t_28_Shares.b IS NULL)) AND
        (COALESCE(t_28_Shares.a, '') = COALESCE(t_30_Shares.b, '') AND (t_28_Shares.a IS NULL) = (t_30_Shares.b IS NULL)) AND
        (COALESCE(t_30_Shares.a, '') = COALESCE(t_32_Shares.b, '') AND (t_30_Shares.a IS NULL) = (t_32_Shares.b IS NULL)) AND
        (COALESCE(t_32_Shares.a, '') = COALESCE(t_34_Shares.b, '') AND (t_32_Shares.a IS NULL) = (t_34_Shares.b IS NULL))
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
        (COALESCE(t_36_Shares.a, '') = COALESCE(t_38_Shares.b, '') AND (t_36_Shares.a IS NULL) = (t_38_Shares.b IS NULL)) AND
        (COALESCE(t_38_Shares.a, '') = COALESCE(t_40_Shares.b, '') AND (t_38_Shares.a IS NULL) = (t_40_Shares.b IS NULL)) AND
        (COALESCE(t_40_Shares.a, '') = COALESCE(t_42_Shares.b, '') AND (t_40_Shares.a IS NULL) = (t_42_Shares.b IS NULL)) AND
        (COALESCE(t_42_Shares.a, '') = COALESCE(t_44_Shares.b, '') AND (t_42_Shares.a IS NULL) = (t_44_Shares.b IS NULL)) AND
        (COALESCE(t_44_Shares.a, '') = COALESCE(t_46_Shares.b, '') AND (t_44_Shares.a IS NULL) = (t_46_Shares.b IS NULL))
    
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
  (COALESCE(t_48_Shares.a, '') = COALESCE(t_47_Linked_RecursiveCte.b, '') AND (t_48_Shares.a IS NULL) = (t_47_Linked_RecursiveCte.b IS NULL))),
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
  (CAST((SELECT
    MIN((CASE WHEN x_224 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_Flagged AS t_49_Flagged, UNNEST(ARRAY[0]) as x_224
  WHERE
    (COALESCE(t_49_Flagged.account, '') = COALESCE(Linked.b, '') AND (t_49_Flagged.account IS NULL) = (Linked.b IS NULL))) AS numeric) IS NULL) AND
  (COALESCE(Linked.a, '') = COALESCE(Flagged.account, '') AND (Linked.a IS NULL) = (Flagged.account IS NULL))
GROUP BY Linked.b ORDER BY account;