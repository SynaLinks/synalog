-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'apple' AS w
   UNION ALL
  
    SELECT
      2 AS id,
      'Apple' AS w
   UNION ALL
  
    SELECT
      3 AS id,
      'banana' AS w
   UNION ALL
  
    SELECT
      4 AS id,
      'Zebra' AS w
   UNION ALL
  
    SELECT
      5 AS id,
      'zebra' AS w
   UNION ALL
  
    SELECT
      6 AS id,
      'éclair' AS w
   UNION ALL
  
    SELECT
      7 AS id,
      'Eclair' AS w
   UNION ALL
  
    SELECT
      8 AS id,
      '10' AS w
   UNION ALL
  
    SELECT
      9 AS id,
      '9' AS w
   UNION ALL
  
    SELECT
      10 AS id,
      'a b' AS w
   UNION ALL
  
    SELECT
      11 AS id,
      'a-b' AS w
   UNION ALL
  
    SELECT
      12 AS id,
      'a_b' AS w
   UNION ALL
  
    SELECT
      13 AS id,
      '' AS w
   UNION ALL
  
    SELECT
      14 AS id,
      'ä' AS w
   UNION ALL
  
    SELECT
      15 AS id,
      'z' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.w AS w,
  t_0_W.id AS id
FROM
  t_1_W AS t_0_W ORDER BY w desc NULLS LAST, id desc NULLS LAST;