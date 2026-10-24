-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord9215874060465158745') then create type synalogrecord9215874060465158745 as ("name" text, "tags" text[]); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ROW('a', ARRAY['x', 'y'])::synalogrecord9215874060465158745 AS r
   UNION ALL
  
    SELECT
      2 AS id,
      ROW('b', CAST('{}' AS text[]))::synalogrecord9215874060465158745 AS r
   UNION ALL
  
    SELECT
      3 AS id,
      ROW('c', ARRAY['y'])::synalogrecord9215874060465158745 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  x_4 AS t
FROM
  t_1_R AS t_0_R, UNNEST((t_0_R.r).tags) as x_4 ORDER BY id, t;