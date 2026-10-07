-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (CASE WHEN LENGTH(CAST(CAST(42 AS BIGINT) AS VARCHAR)) >= 5 THEN CAST(CAST(42 AS BIGINT) AS VARCHAR) ELSE (CASE WHEN 42 < 0 THEN '-' || LPAD(SUBSTR(CAST(CAST(42 AS BIGINT) AS VARCHAR), 2), 4, '0') ELSE LPAD(CAST(CAST(42 AS BIGINT) AS VARCHAR), 5, '0') END) END) AS v;