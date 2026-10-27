-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      -7 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      CAST(2.5 AS double precision) AS x
   UNION ALL
  
    SELECT
      4 AS id,
      CAST(-2.5 AS double precision) AS x
   UNION ALL
  
    SELECT
      5 AS id,
      0 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      3 AS x
   UNION ALL
  
    SELECT
      7 AS id,
      CAST(0.125 AS double precision) AS x
   UNION ALL
  
    SELECT
      8 AS id,
      1000000 AS x
   UNION ALL
  
    SELECT
      9 AS id,
      CAST(-0.75 AS double precision) AS x
   UNION ALL
  
    SELECT
      10 AS id,
      CAST(12.345 AS double precision) AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.id AS id,
  CAST((CASE WHEN ((t_0_V.x) < 0) <> ((2) < 0) THEN CEIL(CAST(t_0_V.x AS double precision) / NULLIF(2, 0)) ELSE FLOOR(CAST(t_0_V.x AS double precision) / NULLIF(2, 0)) END) AS BIGINT) AS v
FROM
  t_1_V AS t_0_V
WHERE
  (COALESCE(FLOOR(t_0_V.x), 0) = COALESCE(t_0_V.x, 0) AND (FLOOR(t_0_V.x) IS NULL) = (t_0_V.x IS NULL)) ORDER BY id;