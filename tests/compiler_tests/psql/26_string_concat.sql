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
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      'John' AS col0,
      'Doe' AS col1
   UNION ALL
  
    SELECT
      'Jane' AS col0,
      'Smith' AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      '' AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.col0 AS first,
  Person.col1 AS last,
  ((Person.col0 || ' ') || Person.col1) AS full_name
FROM
  t_0_Person AS Person ORDER BY full_name;