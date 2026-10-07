-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      90 AS score,
      CAST(2.5 AS double precision) AS x,
      true AS ok
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      75 AS score,
      CAST(null AS numeric) AS x,
      false AS ok
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      90 AS score,
      CAST(3.0 AS double precision) AS x,
      true AS ok
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS name,
      CAST(null AS numeric) AS score,
      CAST(1.25 AS double precision) AS x,
      false AS ok
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      60 AS score,
      CAST(10.0 AS double precision) AS x,
      true AS ok
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS name,
      75 AS score,
      CAST(0.5 AS double precision) AS x,
      CAST(null AS bool) AS ok
   UNION ALL
  
    SELECT
      7 AS id,
      'gus' AS name,
      88 AS score,
      CAST(2.5 AS double precision) AS x,
      false AS ok
   UNION ALL
  
    SELECT
      8 AS id,
      'hal' AS name,
      CAST(null AS numeric) AS score,
      CAST(null AS numeric) AS x,
      true AS ok
   UNION ALL
  
    SELECT
      9 AS id,
      'ida' AS name,
      100 AS score,
      CAST(7.75 AS double precision) AS x,
      false AS ok
   UNION ALL
  
    SELECT
      10 AS id,
      'jon' AS name,
      60 AS score,
      CAST(12.0 AS double precision) AS x,
      true AS ok
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id,
  V.score AS score
FROM
  t_0_V AS V ORDER BY score nulls first, id;