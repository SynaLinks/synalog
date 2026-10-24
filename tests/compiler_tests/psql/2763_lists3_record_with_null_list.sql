-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord1209962559154752866') then create type synalogrecord1209962559154752866 as ("xs" text[]); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW(ARRAY['z'])::synalogrecord1209962559154752866 AS r
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(CAST(null AS text[]))::synalogrecord1209962559154752866 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  CARDINALITY((t_0_R.r).xs) AS n
FROM
  t_1_R AS t_0_R ORDER BY k;