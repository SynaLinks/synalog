-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_D AS (SELECT * FROM (
  
    SELECT
      10 AS dept,
      'eng' AS dname,
      'paris' AS city
   UNION ALL
  
    SELECT
      20 AS dept,
      'ops' AS dname,
      'lyon' AS city
   UNION ALL
  
    SELECT
      40 AS dept,
      'hr' AS dname,
      'nice' AS city
   UNION ALL
  
    SELECT
      CAST(null AS numeric) AS dept,
      'temp' AS dname,
      'lyon' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D.dname AS a,
  t_0_D.dname AS b
FROM
  t_1_D AS D, t_1_D AS t_0_D
WHERE
  (D.dname < t_0_D.dname) AND
  (t_0_D.city = D.city);