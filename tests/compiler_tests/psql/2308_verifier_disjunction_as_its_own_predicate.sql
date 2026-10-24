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
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_Other_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_V.x AS x
    FROM
      t_0_V AS t_3_V
    WHERE
      (t_3_V.x = 2)
   UNION ALL
  
    SELECT
      t_4_V.x AS x
    FROM
      t_0_V AS t_4_V
    WHERE
      (t_4_V.x = 3)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Other AS (SELECT
  Other_MultBodyAggAux.x AS x
FROM
  t_2_Other_MultBodyAggAux AS Other_MultBodyAggAux
GROUP BY Other_MultBodyAggAux.x)
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_Other AS Other, UNNEST(ARRAY[0]::numeric[]) as x_4
  WHERE
    (Other.x = V.x)) AS numeric) IS NULL);