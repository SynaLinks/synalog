-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_27_Path_r0 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_24_Path_r1 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r0.a AS a,
      2 AS b
    FROM
      t_27_Path_r0 AS Path_r0
    WHERE
      (Path_r0.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_21_Path_r2 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r1.a AS a,
      2 AS b
    FROM
      t_24_Path_r1 AS Path_r1
    WHERE
      (Path_r1.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_18_Path_r3 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r2.a AS a,
      2 AS b
    FROM
      t_21_Path_r2 AS Path_r2
    WHERE
      (Path_r2.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_15_Path_r4 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r3.a AS a,
      2 AS b
    FROM
      t_18_Path_r3 AS Path_r3
    WHERE
      (Path_r3.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Path_r5 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r4.a AS a,
      2 AS b
    FROM
      t_15_Path_r4 AS Path_r4
    WHERE
      (Path_r4.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_9_Path_r6 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r5.a AS a,
      2 AS b
    FROM
      t_12_Path_r5 AS Path_r5
    WHERE
      (Path_r5.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_6_Path_r7 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r6.a AS a,
      2 AS b
    FROM
      t_9_Path_r6 AS Path_r6
    WHERE
      (Path_r6.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_3_Path_r8 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r7.a AS a,
      2 AS b
    FROM
      t_6_Path_r7 AS Path_r7
    WHERE
      (Path_r7.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Path_r9 AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r8.a AS a,
      2 AS b
    FROM
      t_3_Path_r8 AS Path_r8
    WHERE
      (Path_r8.b = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_r9.a AS a,
      2 AS b
    FROM
      t_0_Path_r9 AS Path_r9
    WHERE
      (Path_r9.b = 1)
  
) AS UNUSED_TABLE_NAME  ;