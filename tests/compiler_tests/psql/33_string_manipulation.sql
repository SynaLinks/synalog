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
WITH t_1_Names AS (SELECT * FROM (
  
    SELECT
      'alice' AS first,
      'smith' AS last
   UNION ALL
  
    SELECT
      'bob' AS first,
      'jones' AS last
   UNION ALL
  
    SELECT
      'charlie' AS first,
      'brown' AS last
  
) AS UNUSED_TABLE_NAME  ),
t_0_FormattedNames AS (SELECT
  Names.first AS first,
  UPPER(Names.first) AS upper_first,
  LENGTH(Names.last) AS len
FROM
  t_1_Names AS Names ORDER BY first)
SELECT
  FormattedNames.first AS first,
  FormattedNames.upper_first AS upper_first,
  FormattedNames.len AS len
FROM
  t_0_FormattedNames AS FormattedNames ORDER BY first;