-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_ApproverOf AS (SELECT * FROM (
  
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
t_1_Requester AS (SELECT
  ApproverOf.requester AS requester
FROM
  t_2_ApproverOf AS ApproverOf
GROUP BY ApproverOf.requester),
t_4_Effective_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_5_ApproverOf.approver AS approver,
      t_5_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_5_ApproverOf
    WHERE
      (CAST((SELECT
        MIN((CASE WHEN x_17 = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        UNNEST(ARRAY[0]) as x_17
      WHERE
        (t_5_ApproverOf.approver = 'dan')) AS numeric) IS NULL)
   UNION ALL
  
    SELECT
      'fay' AS approver,
      t_6_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_6_ApproverOf
    WHERE
      (t_6_ApproverOf.approver = 'dan')
  
) AS UNUSED_TABLE_NAME  ),
t_3_Effective AS (SELECT
  Effective_MultBodyAggAux.approver AS approver,
  Effective_MultBodyAggAux.requester AS requester
FROM
  t_4_Effective_MultBodyAggAux AS Effective_MultBodyAggAux
GROUP BY Effective_MultBodyAggAux.approver, Effective_MultBodyAggAux.requester)
SELECT
  t_0_Requester.requester AS requester
FROM
  t_1_Requester AS t_0_Requester
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_3_Effective AS Effective, UNNEST(ARRAY[0]) as x_6
  WHERE
    (COALESCE(Effective.requester, '') = COALESCE(t_0_Requester.requester, '') AND (Effective.requester IS NULL) = (t_0_Requester.requester IS NULL))) AS numeric) IS NULL) ORDER BY requester;