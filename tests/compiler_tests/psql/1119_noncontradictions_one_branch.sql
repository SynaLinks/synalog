-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(ARRAY[1, 5, 9]) as x_3
    WHERE
      (x_3 < 3) AND
      (x_3 IS DISTINCT FROM 1)
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(ARRAY[1, 5, 9]) as x_3
    WHERE
      (x_3 > 7) AND
      (x_3 IS DISTINCT FROM 1)
  
) AS UNUSED_TABLE_NAME  ;