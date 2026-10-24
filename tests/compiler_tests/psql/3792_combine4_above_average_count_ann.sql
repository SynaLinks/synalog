-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Synalog type: synalogrecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord481217614') then create type synalogrecord481217614 as (r synalogrecord893574736); end if;
-- Synalog type: synalogrecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord86796764') then create type synalogrecord86796764 as (s text); end if;
END $$;
WITH t_0_O AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS c,
      30 AS amt
   UNION ALL
  
    SELECT
      2 AS id,
      'ann' AS c,
      12 AS amt
   UNION ALL
  
    SELECT
      3 AS id,
      'bob' AS c,
      50 AS amt
   UNION ALL
  
    SELECT
      4 AS id,
      'cid' AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      5 AS id,
      'cid' AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      6 AS id,
      'cid' AS c,
      40 AS amt
   UNION ALL
  
    SELECT
      7 AS id,
      'bob' AS c,
      5 AS amt
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_O AS O
WHERE
  (O.amt > CAST((SELECT
    AVG((CASE WHEN x_6 = 0 THEN t_1_O.amt ELSE NULL END)) AS synalog_value
  FROM
    t_0_O AS t_1_O, UNNEST(ARRAY[0]::numeric[]) as x_6
  WHERE
    (t_1_O.c = 'ann')) AS numeric)) AND
  (O.c = 'ann');