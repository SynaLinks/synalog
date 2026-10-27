-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Parent AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Parent.x AS x,
  t_0_Parent.y AS z
FROM
  t_1_Parent AS Parent, t_1_Parent AS t_0_Parent
WHERE
  (COALESCE(t_0_Parent.x, '') = COALESCE(Parent.y, '') AND (t_0_Parent.x IS NULL) = (Parent.y IS NULL));