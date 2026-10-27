-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Pr AS (SELECT * FROM (
  
    SELECT
      100 AS pid,
      10 AS dept
   UNION ALL
  
    SELECT
      101 AS pid,
      10 AS dept
   UNION ALL
  
    SELECT
      102 AS pid,
      20 AS dept
   UNION ALL
  
    SELECT
      103 AS pid,
      50 AS dept
  
) AS UNUSED_TABLE_NAME  ),
t_1_D AS (SELECT * FROM (
  
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
  Pr.pid AS pid
FROM
  t_0_Pr AS Pr
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_5 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_D AS D, UNNEST(ARRAY[0]) as x_5
  WHERE
    (COALESCE(D.dept, 0) = COALESCE(Pr.dept, 0) AND (D.dept IS NULL) = (Pr.dept IS NULL))) AS numeric) IS NULL);