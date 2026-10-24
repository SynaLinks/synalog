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
-- Synalog type: synalogrecord183863755
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord183863755') then create type synalogrecord183863755 as (arg text, value numeric); end if;
END $$;
WITH t_0_Scores AS (SELECT * FROM (
  
    SELECT
      'Alice' AS col0,
      95 AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      87 AS col1
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      92 AS col1
   UNION ALL
  
    SELECT
      'Diana' AS col0,
      88 AS col1
   UNION ALL
  
    SELECT
      'Eve' AS col0,
      91 AS col1
   UNION ALL
  
    SELECT
      'Frank' AS col0,
      85 AS col1
   UNION ALL
  
    SELECT
      'Grace' AS col0,
      93 AS col1
   UNION ALL
  
    SELECT
      'Henry' AS col0,
      89 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Scores.col0 AS name,
  Scores.col1 AS score
FROM
  t_0_Scores AS Scores ORDER BY score desc LIMIT 3;