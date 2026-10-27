-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    UNNEST(ARRAY[0]) as x_6, UNNEST(ARRAY[0]) as x_8
  WHERE
    (x_8 > 1) AND
    (COALESCE(x_3, 0) = COALESCE(x_8, 0) AND (x_3 IS NULL) = (x_8 IS NULL))) AS numeric) IS NULL) ORDER BY x;