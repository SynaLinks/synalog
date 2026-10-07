-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      'ann' AS u,
      31 AS age
   UNION ALL
  
    SELECT
      'bob' AS u,
      25 AS age
   UNION ALL
  
    SELECT
      'cid' AS u,
      40 AS age
   UNION ALL
  
    SELECT
      'dee' AS u,
      19 AS age
   UNION ALL
  
    SELECT
      'eve' AS u,
      52 AS age
   UNION ALL
  
    SELECT
      'fay' AS u,
      28 AS age
   UNION ALL
  
    SELECT
      'gus' AS u,
      35 AS age
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_U.u AS u
FROM
  t_1_U AS t_0_U
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_U AS t_3_U, UNNEST(ARRAY[0]) as x_4
  WHERE
    (t_3_U.age >= 30) AND
    (t_3_U.age <= 45) AND
    (t_0_U.u = t_3_U.u)) AS numeric) IS NULL) ORDER BY u;