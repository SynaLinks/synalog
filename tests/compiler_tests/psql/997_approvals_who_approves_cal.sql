-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
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
      (CAST((SELECT
        MIN((CASE WHEN x_13 = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        UNNEST(ARRAY[0]::numeric[]) as x_13
      WHERE
        (ApproverOf.approver = 'dan')) AS numeric) IS NULL)
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
  (Effective.requester = 'cal')
GROUP BY Effective.approver ORDER BY approver;