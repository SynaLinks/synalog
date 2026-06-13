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
WITH t_1_Items AS (SELECT * FROM (
  
    SELECT
      'apple' AS name,
      5 AS qty
   UNION ALL
  
    SELECT
      'pear' AS name,
      2 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_0_Labels AS (SELECT
  Items.name AS name,
  FORMAT('%s x%s', Items.name, CAST(Items.qty AS TEXT)) AS label
FROM
  t_1_Items AS Items ORDER BY name)
SELECT
  Labels.name AS name,
  Labels.label AS label
FROM
  t_0_Labels AS Labels ORDER BY name;