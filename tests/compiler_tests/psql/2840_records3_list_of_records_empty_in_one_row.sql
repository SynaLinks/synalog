-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord1627638053154733253') then create type synalogrecord1627638053154733253 as ("n" text); end if; END $$;
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[ROW('a')::synalogrecord1627638053154733253] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      '{}' AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  CARDINALITY(T.l) AS s
FROM
  t_0_T AS T ORDER BY k;