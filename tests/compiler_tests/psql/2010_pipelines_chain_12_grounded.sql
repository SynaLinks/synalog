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
DROP TABLE IF EXISTS synalog_home.C0 CASCADE;
CREATE TABLE synalog_home.C0 AS SELECT
  x_27 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]::numeric[]) as x_27;

-- Interacting with table synalog_home.C0

DROP TABLE IF EXISTS synalog_home.C3 CASCADE;
CREATE TABLE synalog_home.C3 AS SELECT
  C0.x AS x
FROM
  synalog_home.C0 AS C0
WHERE
  (C0.x != 3) AND
  (C0.x != 2) AND
  (C0.x != 1);

-- Interacting with table synalog_home.C3

DROP TABLE IF EXISTS synalog_home.C6 CASCADE;
CREATE TABLE synalog_home.C6 AS SELECT
  C3.x AS x
FROM
  synalog_home.C3 AS C3
WHERE
  (C3.x != 6) AND
  (C3.x != 5) AND
  (C3.x != 4);

-- Interacting with table synalog_home.C6

DROP TABLE IF EXISTS synalog_home.C9 CASCADE;
CREATE TABLE synalog_home.C9 AS SELECT
  C6.x AS x
FROM
  synalog_home.C6 AS C6
WHERE
  (C6.x != 9) AND
  (C6.x != 8) AND
  (C6.x != 7);

-- Interacting with table synalog_home.C9

DROP TABLE IF EXISTS synalog_home.C12 CASCADE;
CREATE TABLE synalog_home.C12 AS SELECT
  C9.x AS x
FROM
  synalog_home.C9 AS C9
WHERE
  (C9.x != 12) AND
  (C9.x != 11) AND
  (C9.x != 10);

-- Interacting with table synalog_home.C12

SELECT
  C12.x AS x
FROM
  synalog_home.C12 AS C12;