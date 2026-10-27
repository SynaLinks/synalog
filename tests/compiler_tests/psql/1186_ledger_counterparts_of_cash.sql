-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Entry AS (SELECT * FROM (
  
    SELECT
      1 AS txn,
      'cash' AS account,
      -500 AS amount
   UNION ALL
  
    SELECT
      1 AS txn,
      'rent' AS account,
      500 AS amount
   UNION ALL
  
    SELECT
      2 AS txn,
      'cash' AS account,
      1200 AS amount
   UNION ALL
  
    SELECT
      2 AS txn,
      'sales' AS account,
      -1200 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'cash' AS account,
      -80 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'food' AS account,
      50 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'travel' AS account,
      30 AS amount
   UNION ALL
  
    SELECT
      4 AS txn,
      'bank' AS account,
      1000 AS amount
   UNION ALL
  
    SELECT
      4 AS txn,
      'cash' AS account,
      -1000 AS amount
   UNION ALL
  
    SELECT
      5 AS txn,
      'food' AS account,
      20 AS amount
   UNION ALL
  
    SELECT
      5 AS txn,
      'cash' AS account,
      -15 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Entry.account AS account
FROM
  t_1_Entry AS Entry, t_1_Entry AS t_0_Entry
WHERE
  (t_0_Entry.account IS DISTINCT FROM 'cash') AND
  (Entry.account = 'cash') AND
  (COALESCE(t_0_Entry.txn, 0) = COALESCE(Entry.txn, 0) AND (t_0_Entry.txn IS NULL) = (Entry.txn IS NULL))
GROUP BY t_0_Entry.account ORDER BY account;