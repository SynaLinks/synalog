-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DROP TABLE IF EXISTS synalog_home.C0 CASCADE;
CREATE TABLE synalog_home.C0 AS SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]) as x_1;

-- Interacting with table synalog_home.C0

DROP TABLE IF EXISTS synalog_home.C3 CASCADE;
CREATE TABLE synalog_home.C3 AS SELECT
  C0.x AS x
FROM
  synalog_home.C0 AS C0
WHERE
  (C0.x IS DISTINCT FROM 3) AND
  (C0.x IS DISTINCT FROM 2) AND
  (C0.x IS DISTINCT FROM 1);

-- Interacting with table synalog_home.C3

DROP TABLE IF EXISTS synalog_home.C6 CASCADE;
CREATE TABLE synalog_home.C6 AS SELECT
  C3.x AS x
FROM
  synalog_home.C3 AS C3
WHERE
  (C3.x IS DISTINCT FROM 6) AND
  (C3.x IS DISTINCT FROM 5) AND
  (C3.x IS DISTINCT FROM 4);

-- Interacting with table synalog_home.C6

DROP TABLE IF EXISTS synalog_home.C9 CASCADE;
CREATE TABLE synalog_home.C9 AS SELECT
  C6.x AS x
FROM
  synalog_home.C6 AS C6
WHERE
  (C6.x IS DISTINCT FROM 9) AND
  (C6.x IS DISTINCT FROM 8) AND
  (C6.x IS DISTINCT FROM 7);

-- Interacting with table synalog_home.C9

DROP TABLE IF EXISTS synalog_home.C12 CASCADE;
CREATE TABLE synalog_home.C12 AS SELECT
  C9.x AS x
FROM
  synalog_home.C9 AS C9
WHERE
  (C9.x IS DISTINCT FROM 12) AND
  (C9.x IS DISTINCT FROM 11) AND
  (C9.x IS DISTINCT FROM 10);

-- Interacting with table synalog_home.C12

DROP TABLE IF EXISTS synalog_home.C15 CASCADE;
CREATE TABLE synalog_home.C15 AS SELECT
  C12.x AS x
FROM
  synalog_home.C12 AS C12
WHERE
  (C12.x IS DISTINCT FROM 15) AND
  (C12.x IS DISTINCT FROM 14) AND
  (C12.x IS DISTINCT FROM 13);

-- Interacting with table synalog_home.C15

SELECT
  C15.x AS x
FROM
  synalog_home.C15 AS C15;