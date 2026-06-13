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
WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      'Alice' AS col1,
      'admin' AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'Bob' AS col1,
      'user' AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      'Charlie' AS col1,
      'user' AS col2
   UNION ALL
  
    SELECT
      4 AS col0,
      'Diana' AS col1,
      'guest' AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      100 AS col1
   UNION ALL
  
    SELECT
      1 AS col0,
      200 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Users.col0 AS id,
  Users.col1 AS name
FROM
  t_0_Users AS Users
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_13 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_Orders AS Orders, UNNEST(ARRAY[0]::numeric[]) as x_13
  WHERE
    (Orders.col0 = Users.col0)) AS numeric) IS NULL) ORDER BY id;