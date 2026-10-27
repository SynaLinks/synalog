-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT * FROM (
  
    SELECT
      'equal' AS test_name,
      5 AS x
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_5
    WHERE
      (5 = x_5)
   UNION ALL
  
    SELECT
      'not_equal' AS test_name,
      x_5 AS x
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_5
    WHERE
      (x_5 IS DISTINCT FROM 5)
   UNION ALL
  
    SELECT
      'less_than' AS test_name,
      x_5 AS x
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_5
    WHERE
      (x_5 < 5)
   UNION ALL
  
    SELECT
      'in_range' AS test_name,
      x_5 AS x
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_5
    WHERE
      (x_5 >= 3) AND
      (x_5 <= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;