-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'north' AS r,
      'ax' AS p,
      3 AS q,
      CAST(10.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      2 AS id,
      'north' AS r,
      'ax' AS p,
      CAST(null AS numeric) AS q,
      CAST(10.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      3 AS id,
      'north' AS r,
      'bo' AS p,
      5 AS q,
      CAST(4.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      4 AS id,
      'south' AS r,
      'ax' AS p,
      1 AS q,
      CAST(12.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      5 AS id,
      'south' AS r,
      'cy' AS p,
      7 AS q,
      CAST(null AS numeric) AS pr
   UNION ALL
  
    SELECT
      6 AS id,
      'south' AS r,
      'cy' AS p,
      2 AS q,
      CAST(3.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      7 AS id,
      'east' AS r,
      'bo' AS p,
      CAST(null AS numeric) AS q,
      CAST(null AS numeric) AS pr
   UNION ALL
  
    SELECT
      8 AS id,
      CAST(null AS text) AS r,
      'ax' AS p,
      4 AS q,
      CAST(9.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      9 AS id,
      CAST(null AS text) AS r,
      'dz' AS p,
      6 AS q,
      CAST(1.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      10 AS id,
      'east' AS r,
      'dz' AS p,
      8 AS q,
      CAST(2.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      11 AS id,
      'north' AS r,
      'cy' AS p,
      3 AS q,
      CAST(6.0 AS double precision) AS pr
   UNION ALL
  
    SELECT
      12 AS id,
      'west' AS r,
      'ax' AS p,
      9 AS q,
      CAST(10.0 AS double precision) AS pr
  
) AS UNUSED_TABLE_NAME  ),
t_1_T AS (SELECT
  S.p AS p,
  SUM(S.q) AS t
FROM
  t_2_S AS S
GROUP BY S.p)
SELECT
  AVG(t_0_T.t) AS m
FROM
  t_1_T AS t_0_T;