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
-- Synalog type: synalogrecord613101336
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord613101336') then create type synalogrecord613101336 as (city text, dept text); end if;
-- Synalog type: synalogrecord8501448
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord8501448') then create type synalogrecord8501448 as (base numeric, bonus numeric); end if;
-- Synalog type: synalogrecord433926068
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord433926068') then create type synalogrecord433926068 as (pay synalogrecord8501448, place synalogrecord613101336); end if;
END $$;
WITH t_0_Emp AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Emp.name AS name,
  (((ROW(Emp.salary, ((Emp.salary) - (1000)))::synalogrecord8501448).base) + ((ROW(Emp.salary, ((Emp.salary) - (1000)))::synalogrecord8501448).bonus)) AS total
FROM
  t_0_Emp AS Emp ORDER BY name, total;