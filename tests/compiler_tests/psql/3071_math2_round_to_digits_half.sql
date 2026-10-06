-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  (SELECT (CASE WHEN synalog_v IS NULL OR 2 IS NULL THEN NULL WHEN CAST(synalog_v AS double precision) = 0 THEN CAST(synalog_v AS double precision) WHEN FLOOR(LOG(ABS(CAST(synalog_v AS double precision)))) - 14 + 2 >= 0 THEN (CASE WHEN CAST(synalog_v AS double precision) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS double precision)) / POWER(10, FLOOR(LOG(ABS(CAST(synalog_v AS double precision)))) - 14) + 0.5) * POWER(10, FLOOR(LOG(ABS(CAST(synalog_v AS double precision)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS double precision) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS double precision)) * POWER(10, 2) + 0.5 + 0.5 * POWER(10, FLOOR(LOG(ABS(CAST(synalog_v AS double precision)))) - 14 + 2)) / POWER(10, 2) + 0 END) FROM (SELECT CAST(1.005 AS double precision) AS synalog_v) AS synalog_n) AS v;