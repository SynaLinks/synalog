-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Synalog type: synalogrecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord481217614') then create type synalogrecord481217614 as (r synalogrecord893574736); end if;
-- Synalog type: synalogrecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord86796764') then create type synalogrecord86796764 as (s text); end if;
END $$;
WITH t_0_Friend AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'a' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS name
FROM
  UNNEST(ARRAY['a', 'b', 'c']::text[]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_Friend AS Friend, UNNEST(ARRAY[0]::numeric[]) as x_6
  WHERE
    (Friend.a = x_3)) AS numeric) IS NULL) ORDER BY name;