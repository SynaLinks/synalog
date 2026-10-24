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
WITH t_1_Tags AS (SELECT * FROM (
  
    SELECT
      'post1' AS col0,
      'tech' AS col1
   UNION ALL
  
    SELECT
      'post1' AS col0,
      'news' AS col1
   UNION ALL
  
    SELECT
      'post1' AS col0,
      'featured' AS col1
   UNION ALL
  
    SELECT
      'post2' AS col0,
      'tech' AS col1
   UNION ALL
  
    SELECT
      'post2' AS col0,
      'tutorial' AS col1
   UNION ALL
  
    SELECT
      'post3' AS col0,
      'news' AS col1
   UNION ALL
  
    SELECT
      'post3' AS col0,
      'news' AS col1
  
) AS UNUSED_TABLE_NAME  ),
t_0_TagCount AS (SELECT
  Tags.col0 AS col0,
  SUM(1) AS count
FROM
  t_1_Tags AS Tags
GROUP BY Tags.col0)
SELECT
  TagCount.col0 AS post,
  TagCount.count AS count
FROM
  t_0_TagCount AS TagCount ORDER BY post;