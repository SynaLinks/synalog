-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
        (t_3_ApproverOf.requester IS NOT DISTINCT FROM t_5_ApproverOf.approver)
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
        (t_7_ApproverOf.requester IS NOT DISTINCT FROM t_9_ApproverOf.approver) AND
        (t_9_ApproverOf.requester IS NOT DISTINCT FROM t_11_ApproverOf.approver)
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
        (t_13_ApproverOf.requester IS NOT DISTINCT FROM t_15_ApproverOf.approver) AND
        (t_15_ApproverOf.requester IS NOT DISTINCT FROM t_17_ApproverOf.approver) AND
        (t_17_ApproverOf.requester IS NOT DISTINCT FROM t_19_ApproverOf.approver)
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
        (t_21_ApproverOf.requester IS NOT DISTINCT FROM t_23_ApproverOf.approver) AND
        (t_23_ApproverOf.requester IS NOT DISTINCT FROM t_25_ApproverOf.approver) AND
        (t_25_ApproverOf.requester IS NOT DISTINCT FROM t_27_ApproverOf.approver) AND
        (t_27_ApproverOf.requester IS NOT DISTINCT FROM t_29_ApproverOf.approver)
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
        (t_31_ApproverOf.requester IS NOT DISTINCT FROM t_33_ApproverOf.approver) AND
        (t_33_ApproverOf.requester IS NOT DISTINCT FROM t_35_ApproverOf.approver) AND
        (t_35_ApproverOf.requester IS NOT DISTINCT FROM t_37_ApproverOf.approver) AND
        (t_37_ApproverOf.requester IS NOT DISTINCT FROM t_39_ApproverOf.approver) AND
        (t_39_ApproverOf.requester IS NOT DISTINCT FROM t_41_ApproverOf.approver)
    
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
  (t_43_ApproverOf.requester IS NOT DISTINCT FROM t_42_Above_RecursiveCte.approver)),
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