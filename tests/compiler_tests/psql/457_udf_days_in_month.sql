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
SELECT
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN (((MOD(2024, 4)) = 0) AND (((MOD(2024, 100)) != 0) OR ((MOD(2024, 400)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS a,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN (((MOD(2023, 4)) = 0) AND (((MOD(2023, 100)) != 0) OR ((MOD(2023, 400)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS b,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN (((MOD(2000, 4)) = 0) AND (((MOD(2000, 100)) != 0) OR ((MOD(2000, 400)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS c,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN (((MOD(1900, 4)) = 0) AND (((MOD(1900, 100)) != 0) OR ((MOD(1900, 400)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS d,
  CASE WHEN (4 = 2) THEN ((28) + (CASE WHEN (((MOD(2023, 4)) = 0) AND (((MOD(2023, 100)) != 0) OR ((MOD(2023, 400)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((4 = 4) OR (4 = 6)) OR (4 = 9)) OR (4 = 11)) THEN 30 ELSE 31 END AS e,
  CASE WHEN (12 = 2) THEN ((28) + (CASE WHEN (((MOD(2023, 4)) = 0) AND (((MOD(2023, 100)) != 0) OR ((MOD(2023, 400)) = 0))) THEN 1 ELSE 0 END)) WHEN ((((12 = 4) OR (12 = 6)) OR (12 = 9)) OR (12 = 11)) THEN 30 ELSE 31 END AS f;