-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      2 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Edge.x AS x
FROM
  t_0_Edge AS Edge
WHERE
  (COALESCE(Edge.y, 0) = COALESCE(Edge.x, 0) AND (Edge.y IS NULL) = (Edge.x IS NULL));