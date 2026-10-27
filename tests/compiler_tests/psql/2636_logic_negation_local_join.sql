-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      7 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      8 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT * FROM (
  
    SELECT
      7 AS b
   UNION ALL
  
    SELECT
      8 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_4 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_4
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_9 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_E AS E, t_1_L AS L, UNNEST(ARRAY[0]) as x_9
  WHERE
    (COALESCE(E.a, 0) = COALESCE(x_4, 0) AND (E.a IS NULL) = (x_4 IS NULL)) AND
    (COALESCE(L.b, 0) = COALESCE(E.b, 0) AND (L.b IS NULL) = (E.b IS NULL))) AS numeric) IS NULL) ORDER BY x;