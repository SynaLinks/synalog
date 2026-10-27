-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Above_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        ApproverOf.approver AS approver,
        ApproverOf.requester AS requester,
        0 AS synalog_step
      FROM
        t_2_ApproverOf AS ApproverOf
     UNION ALL
    
      SELECT
        t_3_ApproverOf.approver AS approver,
        t_5_ApproverOf.requester AS requester,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_ApproverOf AS t_5_ApproverOf, t_2_ApproverOf AS t_3_ApproverOf
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_3_ApproverOf.requester, '') = COALESCE(t_5_ApproverOf.approver, '') AND (t_3_ApproverOf.requester IS NULL) = (t_5_ApproverOf.approver IS NULL))
     UNION ALL
    
      SELECT
        t_7_ApproverOf.approver AS approver,
        t_11_ApproverOf.requester AS requester,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ApproverOf AS t_11_ApproverOf, t_2_ApproverOf AS t_9_ApproverOf, t_2_ApproverOf AS t_7_ApproverOf
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_7_ApproverOf.requester, '') = COALESCE(t_9_ApproverOf.approver, '') AND (t_7_ApproverOf.requester IS NULL) = (t_9_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_9_ApproverOf.requester, '') = COALESCE(t_11_ApproverOf.approver, '') AND (t_9_ApproverOf.requester IS NULL) = (t_11_ApproverOf.approver IS NULL))
     UNION ALL
    
      SELECT
        t_13_ApproverOf.approver AS approver,
        t_19_ApproverOf.requester AS requester,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ApproverOf AS t_19_ApproverOf, t_2_ApproverOf AS t_17_ApproverOf, t_2_ApproverOf AS t_15_ApproverOf, t_2_ApproverOf AS t_13_ApproverOf
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_13_ApproverOf.requester, '') = COALESCE(t_15_ApproverOf.approver, '') AND (t_13_ApproverOf.requester IS NULL) = (t_15_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_15_ApproverOf.requester, '') = COALESCE(t_17_ApproverOf.approver, '') AND (t_15_ApproverOf.requester IS NULL) = (t_17_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_17_ApproverOf.requester, '') = COALESCE(t_19_ApproverOf.approver, '') AND (t_17_ApproverOf.requester IS NULL) = (t_19_ApproverOf.approver IS NULL))
     UNION ALL
    
      SELECT
        t_21_ApproverOf.approver AS approver,
        t_29_ApproverOf.requester AS requester,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ApproverOf AS t_29_ApproverOf, t_2_ApproverOf AS t_27_ApproverOf, t_2_ApproverOf AS t_25_ApproverOf, t_2_ApproverOf AS t_23_ApproverOf, t_2_ApproverOf AS t_21_ApproverOf
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_21_ApproverOf.requester, '') = COALESCE(t_23_ApproverOf.approver, '') AND (t_21_ApproverOf.requester IS NULL) = (t_23_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_23_ApproverOf.requester, '') = COALESCE(t_25_ApproverOf.approver, '') AND (t_23_ApproverOf.requester IS NULL) = (t_25_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_25_ApproverOf.requester, '') = COALESCE(t_27_ApproverOf.approver, '') AND (t_25_ApproverOf.requester IS NULL) = (t_27_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_27_ApproverOf.requester, '') = COALESCE(t_29_ApproverOf.approver, '') AND (t_27_ApproverOf.requester IS NULL) = (t_29_ApproverOf.approver IS NULL))
     UNION ALL
    
      SELECT
        t_31_ApproverOf.approver AS approver,
        t_41_ApproverOf.requester AS requester,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ApproverOf AS t_41_ApproverOf, t_2_ApproverOf AS t_39_ApproverOf, t_2_ApproverOf AS t_37_ApproverOf, t_2_ApproverOf AS t_35_ApproverOf, t_2_ApproverOf AS t_33_ApproverOf, t_2_ApproverOf AS t_31_ApproverOf
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_31_ApproverOf.requester, '') = COALESCE(t_33_ApproverOf.approver, '') AND (t_31_ApproverOf.requester IS NULL) = (t_33_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_33_ApproverOf.requester, '') = COALESCE(t_35_ApproverOf.approver, '') AND (t_33_ApproverOf.requester IS NULL) = (t_35_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_35_ApproverOf.requester, '') = COALESCE(t_37_ApproverOf.approver, '') AND (t_35_ApproverOf.requester IS NULL) = (t_37_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_37_ApproverOf.requester, '') = COALESCE(t_39_ApproverOf.approver, '') AND (t_37_ApproverOf.requester IS NULL) = (t_39_ApproverOf.approver IS NULL)) AND
        (COALESCE(t_39_ApproverOf.requester, '') = COALESCE(t_41_ApproverOf.approver, '') AND (t_39_ApproverOf.requester IS NULL) = (t_41_ApproverOf.approver IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_43_ApproverOf.approver AS approver,
  t_42_Above_RecursiveCte.requester AS requester,
  ((t_42_Above_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Above_RecursiveCte AS t_42_Above_RecursiveCte, t_2_ApproverOf AS t_43_ApproverOf
WHERE
  (t_42_Above_RecursiveCte.synalog_step < 6) AND
  (COALESCE(t_43_ApproverOf.requester, '') = COALESCE(t_42_Above_RecursiveCte.approver, '') AND (t_43_ApproverOf.requester IS NULL) = (t_42_Above_RecursiveCte.approver IS NULL))),
t_0_Above AS (SELECT
  Above_RecursiveCte.approver AS approver,
  Above_RecursiveCte.requester AS requester
FROM
  t_1_Above_RecursiveCte AS Above_RecursiveCte
GROUP BY Above_RecursiveCte.approver, Above_RecursiveCte.requester)
SELECT
  Above.approver AS approver
FROM
  t_0_Above AS Above
WHERE
  (Above.requester = 'bea')
GROUP BY Above.approver ORDER BY approver;