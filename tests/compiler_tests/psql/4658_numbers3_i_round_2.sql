-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      17 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      -17 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      4 AS x
   UNION ALL
  
    SELECT
      4 AS k,
      0 AS x
   UNION ALL
  
    SELECT
      5 AS k,
      CAST(null AS numeric) AS x
   UNION ALL
  
    SELECT
      6 AS k,
      3000000000 AS x
   UNION ALL
  
    SELECT
      7 AS k,
      -1 AS x
   UNION ALL
  
    SELECT
      8 AS k,
      9 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_X.k AS k,
  (SELECT (CASE WHEN synalog_v IS NULL OR 2 IS NULL THEN NULL WHEN CAST(synalog_v AS double precision) = 0 THEN CAST(synalog_v AS double precision) WHEN FLOOR(LOG(ABS(CAST(synalog_v AS double precision)))) - 14 + 2 >= 0 THEN (CASE WHEN CAST(synalog_v AS double precision) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS double precision)) / POWER(10, FLOOR(LOG(ABS(CAST(synalog_v AS double precision)))) - 14) + 0.5) * POWER(10, FLOOR(LOG(ABS(CAST(synalog_v AS double precision)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS double precision) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS double precision)) * POWER(10, 2) + 0.5 + 0.5 * POWER(10, FLOOR(LOG(ABS(CAST(synalog_v AS double precision)))) - 14 + 2)) / POWER(10, 2) + 0 END) FROM (SELECT t_0_X.x AS synalog_v) AS synalog_n) AS v
FROM
  t_1_X AS t_0_X ORDER BY k;