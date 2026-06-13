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
WITH t_1_Transactions AS (SELECT * FROM (
  
    SELECT
      'Alice' AS col0,
      'purchase' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Alice' AS col0,
      'purchase' AS col1,
      50 AS col2
   UNION ALL
  
    SELECT
      'Alice' AS col0,
      'refund' AS col1,
      30 AS col2
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      'purchase' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      'purchase' AS col1,
      75 AS col2
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      'purchase' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      'refund' AS col1,
      50 AS col2
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      'purchase' AS col1,
      100 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_CustomerStats AS (SELECT
  Transactions.col0 AS col0,
  SUM(Transactions.col2) AS total,
  SUM(1) AS count,
  MAX(Transactions.col2) AS max_txn,
  MIN(Transactions.col2) AS min_txn,
  AVG(Transactions.col2) AS avg_txn
FROM
  t_1_Transactions AS Transactions
GROUP BY Transactions.col0)
SELECT
  CustomerStats.col0 AS customer,
  CustomerStats.total AS total,
  CustomerStats.count AS count,
  CustomerStats.max_txn AS max_txn
FROM
  t_0_CustomerStats AS CustomerStats ORDER BY customer;