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
-- Synalog type: synalogrecord284854704
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord284854704') then create type synalogrecord284854704 as (tag text); end if;
END $$;
WITH t_1_Emp AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      'eng' AS dept,
      7000 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'bob' AS name,
      'eng' AS dept,
      5200 AS salary,
      'lyon' AS city
   UNION ALL
  
    SELECT
      'cid' AS name,
      'ops' AS dept,
      4100 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'dan' AS name,
      'ops' AS dept,
      3900 AS salary,
      'nice' AS city
   UNION ALL
  
    SELECT
      'eve' AS name,
      'sales' AS dept,
      6100 AS salary,
      'lyon' AS city
   UNION ALL
  
    SELECT
      'fay' AS name,
      'sales' AS dept,
      2800 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'gus' AS name,
      'hr' AS dept,
      4500 AS salary,
      'nice' AS city
   UNION ALL
  
    SELECT
      'hal' AS name,
      'eng' AS dept,
      9100 AS salary,
      'nice' AS city
  
) AS UNUSED_TABLE_NAME  ),
t_0_T AS (SELECT * FROM (
  
    SELECT
      Emp.name AS name,
      ROW(Emp.city)::synalogrecord284854704 AS r
    FROM
      t_1_Emp AS Emp
    WHERE
      (Emp.dept = 'sales')
   UNION ALL
  
    SELECT
      t_2_Emp.name AS name,
      ROW(t_2_Emp.dept)::synalogrecord284854704 AS r
    FROM
      t_1_Emp AS t_2_Emp
    WHERE
      (t_2_Emp.salary > 9000)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.name AS name,
  (T.r).tag AS tag
FROM
  t_0_T AS T ORDER BY name, tag;