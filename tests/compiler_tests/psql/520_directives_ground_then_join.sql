-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS synalog_home.G CASCADE;
CREATE TABLE synalog_home.G AS SELECT
  x_1 AS k
FROM
  UNNEST(ARRAY[1]) as x_1;

-- Interacting with table synalog_home.G

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  G.k AS k,
  N.s AS s
FROM
  synalog_home.G AS G, t_0_N AS N
WHERE
  (COALESCE(N.k, 0) = COALESCE(G.k, 0) AND (N.k IS NULL) = (G.k IS NULL));