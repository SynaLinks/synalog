-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_ParentOf AS (SELECT * FROM (
  
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
t_1_Anc_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        ParentOf.parent_id AS a,
        ParentOf.child_id AS d,
        0 AS synalog_step
      FROM
        t_2_ParentOf AS ParentOf
     UNION ALL
    
      SELECT
        t_5_ParentOf.parent_id AS a,
        t_3_ParentOf.child_id AS d,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_5_ParentOf, t_2_ParentOf AS t_3_ParentOf
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_3_ParentOf.parent_id, 0) = COALESCE(t_5_ParentOf.child_id, 0) AND (t_3_ParentOf.parent_id IS NULL) = (t_5_ParentOf.child_id IS NULL))
     UNION ALL
    
      SELECT
        t_11_ParentOf.parent_id AS a,
        t_7_ParentOf.child_id AS d,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_11_ParentOf, t_2_ParentOf AS t_9_ParentOf, t_2_ParentOf AS t_7_ParentOf
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_7_ParentOf.parent_id, 0) = COALESCE(t_9_ParentOf.child_id, 0) AND (t_7_ParentOf.parent_id IS NULL) = (t_9_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_9_ParentOf.parent_id, 0) = COALESCE(t_11_ParentOf.child_id, 0) AND (t_9_ParentOf.parent_id IS NULL) = (t_11_ParentOf.child_id IS NULL))
     UNION ALL
    
      SELECT
        t_19_ParentOf.parent_id AS a,
        t_13_ParentOf.child_id AS d,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_19_ParentOf, t_2_ParentOf AS t_17_ParentOf, t_2_ParentOf AS t_15_ParentOf, t_2_ParentOf AS t_13_ParentOf
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_13_ParentOf.parent_id, 0) = COALESCE(t_15_ParentOf.child_id, 0) AND (t_13_ParentOf.parent_id IS NULL) = (t_15_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_15_ParentOf.parent_id, 0) = COALESCE(t_17_ParentOf.child_id, 0) AND (t_15_ParentOf.parent_id IS NULL) = (t_17_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_17_ParentOf.parent_id, 0) = COALESCE(t_19_ParentOf.child_id, 0) AND (t_17_ParentOf.parent_id IS NULL) = (t_19_ParentOf.child_id IS NULL))
     UNION ALL
    
      SELECT
        t_29_ParentOf.parent_id AS a,
        t_21_ParentOf.child_id AS d,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_29_ParentOf, t_2_ParentOf AS t_27_ParentOf, t_2_ParentOf AS t_25_ParentOf, t_2_ParentOf AS t_23_ParentOf, t_2_ParentOf AS t_21_ParentOf
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_21_ParentOf.parent_id, 0) = COALESCE(t_23_ParentOf.child_id, 0) AND (t_21_ParentOf.parent_id IS NULL) = (t_23_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_23_ParentOf.parent_id, 0) = COALESCE(t_25_ParentOf.child_id, 0) AND (t_23_ParentOf.parent_id IS NULL) = (t_25_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_25_ParentOf.parent_id, 0) = COALESCE(t_27_ParentOf.child_id, 0) AND (t_25_ParentOf.parent_id IS NULL) = (t_27_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_27_ParentOf.parent_id, 0) = COALESCE(t_29_ParentOf.child_id, 0) AND (t_27_ParentOf.parent_id IS NULL) = (t_29_ParentOf.child_id IS NULL))
     UNION ALL
    
      SELECT
        t_41_ParentOf.parent_id AS a,
        t_31_ParentOf.child_id AS d,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_41_ParentOf, t_2_ParentOf AS t_39_ParentOf, t_2_ParentOf AS t_37_ParentOf, t_2_ParentOf AS t_35_ParentOf, t_2_ParentOf AS t_33_ParentOf, t_2_ParentOf AS t_31_ParentOf
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_31_ParentOf.parent_id, 0) = COALESCE(t_33_ParentOf.child_id, 0) AND (t_31_ParentOf.parent_id IS NULL) = (t_33_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_33_ParentOf.parent_id, 0) = COALESCE(t_35_ParentOf.child_id, 0) AND (t_33_ParentOf.parent_id IS NULL) = (t_35_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_35_ParentOf.parent_id, 0) = COALESCE(t_37_ParentOf.child_id, 0) AND (t_35_ParentOf.parent_id IS NULL) = (t_37_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_37_ParentOf.parent_id, 0) = COALESCE(t_39_ParentOf.child_id, 0) AND (t_37_ParentOf.parent_id IS NULL) = (t_39_ParentOf.child_id IS NULL)) AND
        (COALESCE(t_39_ParentOf.parent_id, 0) = COALESCE(t_41_ParentOf.child_id, 0) AND (t_39_ParentOf.parent_id IS NULL) = (t_41_ParentOf.child_id IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Anc_RecursiveCte.a AS a,
  t_43_ParentOf.child_id AS d,
  ((t_42_Anc_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Anc_RecursiveCte AS t_42_Anc_RecursiveCte, t_2_ParentOf AS t_43_ParentOf
WHERE
  (t_42_Anc_RecursiveCte.synalog_step < 8) AND
  (COALESCE(t_43_ParentOf.parent_id, 0) = COALESCE(t_42_Anc_RecursiveCte.d, 0) AND (t_43_ParentOf.parent_id IS NULL) = (t_42_Anc_RecursiveCte.d IS NULL))),
t_0_Anc AS (SELECT
  Anc_RecursiveCte.a AS a,
  Anc_RecursiveCte.d AS d
FROM
  t_1_Anc_RecursiveCte AS Anc_RecursiveCte
GROUP BY Anc_RecursiveCte.a, Anc_RecursiveCte.d)
SELECT
  Anc.a AS n
FROM
  t_0_Anc AS Anc
WHERE
  (COALESCE(Anc.d, 0) = COALESCE(Anc.a, 0) AND (Anc.d IS NULL) = (Anc.a IS NULL))
GROUP BY Anc.a ORDER BY n;