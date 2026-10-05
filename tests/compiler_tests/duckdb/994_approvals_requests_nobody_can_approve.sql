-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
      ((SELECT
        MIN((CASE WHEN x_17.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        (select unnest([0]) as unnested_pod) as x_17
      WHERE
        (t_5_ApproverOf.approver = 'dan')) IS NULL)
   UNION ALL
  
    SELECT
      'fay' AS approver,
      t_6_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_6_ApproverOf
    WHERE
      (t_6_ApproverOf.approver = 'dan') AND
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
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_Effective AS Effective, (select unnest([0]) as unnested_pod) as x_6
  WHERE
    (Effective.requester = t_0_Requester.requester)) IS NULL) ORDER BY requester;