-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y,
      1 AS id
   UNION ALL
  
    SELECT
      1 AS x,
      3 AS y,
      2 AS id
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.id AS id
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (COALESCE(B.x, 0) = COALESCE(A.x, 0) AND (B.x IS NULL) = (A.x IS NULL)) AND
  (COALESCE(B.y, 0) = COALESCE(A.y, 0) AND (B.y IS NULL) = (A.y IS NULL));