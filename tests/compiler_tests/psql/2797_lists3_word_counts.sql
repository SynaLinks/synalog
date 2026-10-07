-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red green blue' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'red red' AS s
   UNION ALL
  
    SELECT
      3 AS id,
      'blue' AS s
   UNION ALL
  
    SELECT
      4 AS id,
      '' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_2 AS w,
  SUM(1) AS n
FROM
  t_1_W AS t_0_W, UNNEST((CASE WHEN t_0_W.s = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY(t_0_W.s, ' ') END)) as x_2
WHERE
  (x_2 != '')
GROUP BY x_2 ORDER BY w, n;