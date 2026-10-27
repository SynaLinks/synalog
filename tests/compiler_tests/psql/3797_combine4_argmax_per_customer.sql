-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord15014184063026700746') then create type synalogrecord15014184063026700746 as ("arg" numeric, "value" numeric); end if; END $$;
WITH t_2_O AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_3_C AS (SELECT * FROM (
  
    SELECT
      'ann' AS c
   UNION ALL
  
    SELECT
      'bob' AS c
   UNION ALL
  
    SELECT
      'cid' AS c
   UNION ALL
  
    SELECT
      'dee' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_C.c AS c,
  (SELECT
  (ARRAY_AGG(((CASE WHEN x_10 = 0 THEN ROW(O.id, O.amt)::synalogrecord15014184063026700746 ELSE NULL END)).arg order by ((CASE WHEN x_10 = 0 THEN ROW(O.id, O.amt)::synalogrecord15014184063026700746 ELSE NULL END)).value desc nulls last))[1] AS synalog_value
FROM
  t_2_O AS O, UNNEST(ARRAY[0]) as x_10
WHERE
  (COALESCE(O.c, '') = COALESCE(t_0_C.c, '') AND (O.c IS NULL) = (t_0_C.c IS NULL))) AS best
FROM
  t_3_C AS t_0_C ORDER BY c;