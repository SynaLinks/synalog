-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (CASE WHEN LENGTH(CAST(CAST(-42 AS BIGINT) AS VARCHAR)) >= 5 THEN CAST(CAST(-42 AS BIGINT) AS VARCHAR) ELSE (CASE WHEN -42 < 0 THEN '-' || LPAD(SUBSTR(CAST(CAST(-42 AS BIGINT) AS VARCHAR), 2), 4, '0') ELSE LPAD(CAST(CAST(-42 AS BIGINT) AS VARCHAR), 5, '0') END) END) AS a,
  CAST(CAST(3.14159 AS DECIMAL(38, 2)) AS VARCHAR) AS b,
  (CASE WHEN LENGTH('a') >= 3 THEN 'a' ELSE LPAD('a', 3, ' ') END) || '|' || (CASE WHEN LENGTH('b') >= 3 THEN 'b' ELSE RPAD('b', 3, ' ') END) || '|' AS c,
  '100%' AS d,
  CAST(CAST(1234567 AS BIGINT) AS VARCHAR) AS e;