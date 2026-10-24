-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_Score AS (SELECT * FROM (
  
    SELECT
      'Alice' AS player,
      85 AS points
   UNION ALL
  
    SELECT
      'Bob' AS player,
      92 AS points
   UNION ALL
  
    SELECT
      'Charlie' AS player,
      78 AS points
  
) AS UNUSED_TABLE_NAME  ),
t_0_BestPlayer AS (SELECT
  (ARRAY_AGG(Score.player order by Score.points desc nulls last))[1] AS synalog_value
FROM
  t_2_Score AS Score),
t_3_WorstPlayer AS (SELECT
  (ARRAY_AGG(t_4_Score.player order by t_4_Score.points nulls last))[1] AS synalog_value
FROM
  t_2_Score AS t_4_Score)
SELECT
  BestPlayer.synalog_value AS best,
  WorstPlayer.synalog_value AS worst
FROM
  t_0_BestPlayer AS BestPlayer, t_3_WorstPlayer AS WorstPlayer;