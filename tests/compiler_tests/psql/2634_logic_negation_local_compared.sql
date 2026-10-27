-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      9 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_4 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_4
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_8 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_E AS E, UNNEST(ARRAY[0]) as x_8
  WHERE
    (E.b > 5) AND
    (COALESCE(E.a, 0) = COALESCE(x_4, 0) AND (E.a IS NULL) = (x_4 IS NULL))) AS numeric) IS NULL) ORDER BY x;