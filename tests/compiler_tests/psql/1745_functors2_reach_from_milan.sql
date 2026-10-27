-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Ship AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'acme' AS client,
      'paris' AS src,
      'lyon' AS dst,
      12 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      2 AS id,
      'acme' AS client,
      'lyon' AS src,
      'nice' AS dst,
      5 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      3 AS id,
      'bolt' AS client,
      'paris' AS src,
      'nice' AS dst,
      30 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      4 AS id,
      'bolt' AS client,
      'nice' AS src,
      'rome' AS dst,
      8 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      5 AS id,
      'cora' AS client,
      'rome' AS src,
      'milan' AS dst,
      14 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      6 AS id,
      'cora' AS client,
      'milan' AS src,
      'paris' AS dst,
      3 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      7 AS id,
      'acme' AS client,
      'paris' AS src,
      'rome' AS dst,
      22 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      8 AS id,
      'dune' AS client,
      'lyon' AS src,
      'paris' AS dst,
      9 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      9 AS id,
      'dune' AS client,
      'nice' AS src,
      'lyon' AS dst,
      11 AS kg,
      'dhl' AS carrier
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_RecursiveCte_f1 AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Ship.src AS a,
        Ship.dst AS b,
        0 AS synalog_step
      FROM
        t_2_Ship AS Ship
     UNION ALL
    
      SELECT
        t_7_Ship.src AS a,
        t_5_Ship.dst AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Ship AS t_7_Ship, t_2_Ship AS t_5_Ship
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_5_Ship.src, '') = COALESCE(t_7_Ship.dst, '') AND (t_5_Ship.src IS NULL) = (t_7_Ship.dst IS NULL))
     UNION ALL
    
      SELECT
        t_16_Ship.src AS a,
        t_12_Ship.dst AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Ship AS t_16_Ship, t_2_Ship AS t_14_Ship, t_2_Ship AS t_12_Ship
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_12_Ship.src, '') = COALESCE(t_14_Ship.dst, '') AND (t_12_Ship.src IS NULL) = (t_14_Ship.dst IS NULL)) AND
        (COALESCE(t_14_Ship.src, '') = COALESCE(t_16_Ship.dst, '') AND (t_14_Ship.src IS NULL) = (t_16_Ship.dst IS NULL))
     UNION ALL
    
      SELECT
        t_28_Ship.src AS a,
        t_21_Ship.dst AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Ship AS t_28_Ship, t_2_Ship AS t_26_Ship, t_2_Ship AS t_24_Ship, t_2_Ship AS t_21_Ship
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_21_Ship.src, '') = COALESCE(t_24_Ship.dst, '') AND (t_21_Ship.src IS NULL) = (t_24_Ship.dst IS NULL)) AND
        (COALESCE(t_24_Ship.src, '') = COALESCE(t_26_Ship.dst, '') AND (t_24_Ship.src IS NULL) = (t_26_Ship.dst IS NULL)) AND
        (COALESCE(t_26_Ship.src, '') = COALESCE(t_28_Ship.dst, '') AND (t_26_Ship.src IS NULL) = (t_28_Ship.dst IS NULL))
     UNION ALL
    
      SELECT
        t_43_Ship.src AS a,
        t_33_Ship.dst AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Ship AS t_43_Ship, t_2_Ship AS t_41_Ship, t_2_Ship AS t_39_Ship, t_2_Ship AS t_36_Ship, t_2_Ship AS t_33_Ship
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_33_Ship.src, '') = COALESCE(t_36_Ship.dst, '') AND (t_33_Ship.src IS NULL) = (t_36_Ship.dst IS NULL)) AND
        (COALESCE(t_36_Ship.src, '') = COALESCE(t_39_Ship.dst, '') AND (t_36_Ship.src IS NULL) = (t_39_Ship.dst IS NULL)) AND
        (COALESCE(t_39_Ship.src, '') = COALESCE(t_41_Ship.dst, '') AND (t_39_Ship.src IS NULL) = (t_41_Ship.dst IS NULL)) AND
        (COALESCE(t_41_Ship.src, '') = COALESCE(t_43_Ship.dst, '') AND (t_41_Ship.src IS NULL) = (t_43_Ship.dst IS NULL))
     UNION ALL
    
      SELECT
        t_61_Ship.src AS a,
        t_48_Ship.dst AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Ship AS t_61_Ship, t_2_Ship AS t_59_Ship, t_2_Ship AS t_57_Ship, t_2_Ship AS t_54_Ship, t_2_Ship AS t_51_Ship, t_2_Ship AS t_48_Ship
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_48_Ship.src, '') = COALESCE(t_51_Ship.dst, '') AND (t_48_Ship.src IS NULL) = (t_51_Ship.dst IS NULL)) AND
        (COALESCE(t_51_Ship.src, '') = COALESCE(t_54_Ship.dst, '') AND (t_51_Ship.src IS NULL) = (t_54_Ship.dst IS NULL)) AND
        (COALESCE(t_54_Ship.src, '') = COALESCE(t_57_Ship.dst, '') AND (t_54_Ship.src IS NULL) = (t_57_Ship.dst IS NULL)) AND
        (COALESCE(t_57_Ship.src, '') = COALESCE(t_59_Ship.dst, '') AND (t_57_Ship.src IS NULL) = (t_59_Ship.dst IS NULL)) AND
        (COALESCE(t_59_Ship.src, '') = COALESCE(t_61_Ship.dst, '') AND (t_59_Ship.src IS NULL) = (t_61_Ship.dst IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_62_Reach_RecursiveCte_f1.a AS a,
  t_64_Ship.dst AS b,
  ((t_62_Reach_RecursiveCte_f1.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte_f1 AS t_62_Reach_RecursiveCte_f1, t_2_Ship AS t_64_Ship
WHERE
  (t_62_Reach_RecursiveCte_f1.synalog_step < 6) AND
  (COALESCE(t_62_Reach_RecursiveCte_f1.b, '') = COALESCE(t_64_Ship.src, '') AND (t_62_Reach_RecursiveCte_f1.b IS NULL) = (t_64_Ship.src IS NULL))),
t_0_R AS (SELECT
  Reach_RecursiveCte_f1.a AS a,
  Reach_RecursiveCte_f1.b AS b
FROM
  t_1_Reach_RecursiveCte_f1 AS Reach_RecursiveCte_f1
GROUP BY Reach_RecursiveCte_f1.a, Reach_RecursiveCte_f1.b)
SELECT
  R.b AS b
FROM
  t_0_R AS R
WHERE
  (R.a = 'milan') ORDER BY b;