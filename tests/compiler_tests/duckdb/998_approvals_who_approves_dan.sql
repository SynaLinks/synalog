-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
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
t_1_Effective_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS ApproverOf
    WHERE
      ((SELECT
        MIN((CASE WHEN x_13.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        (select unnest([0]::numeric[]) as unnested_pod) as x_13
      WHERE
        (ApproverOf.approver = 'dan')) IS NULL)
   UNION ALL
  
    SELECT
      'fay' AS approver,
      t_3_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.approver = 'dan') AND
      (t_3_ApproverOf.approver = 'dan')
  
) AS UNUSED_TABLE_NAME  ),
t_0_Effective AS (SELECT
  Effective_MultBodyAggAux.approver AS approver,
  Effective_MultBodyAggAux.requester AS requester
FROM
  t_1_Effective_MultBodyAggAux AS Effective_MultBodyAggAux
GROUP BY Effective_MultBodyAggAux.approver, Effective_MultBodyAggAux.requester)
SELECT
  Effective.approver AS approver
FROM
  t_0_Effective AS Effective
WHERE
  (Effective.requester = 'dan')
GROUP BY Effective.approver ORDER BY approver;