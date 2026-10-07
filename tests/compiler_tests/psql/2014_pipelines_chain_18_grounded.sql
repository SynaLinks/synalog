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
DROP TABLE IF EXISTS logica_home.C0 CASCADE;
CREATE TABLE logica_home.C0 AS SELECT
  x_39 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]::numeric[]) as x_39;

-- Interacting with table logica_home.C0

DROP TABLE IF EXISTS logica_home.C3 CASCADE;
CREATE TABLE logica_home.C3 AS SELECT
  C0.x AS x
FROM
  logica_home.C0 AS C0
WHERE
  (C0.x != 3) AND
  (C0.x != 2) AND
  (C0.x != 1);

-- Interacting with table logica_home.C3

DROP TABLE IF EXISTS logica_home.C6 CASCADE;
CREATE TABLE logica_home.C6 AS SELECT
  C3.x AS x
FROM
  logica_home.C3 AS C3
WHERE
  (C3.x != 6) AND
  (C3.x != 5) AND
  (C3.x != 4);

-- Interacting with table logica_home.C6

DROP TABLE IF EXISTS logica_home.C9 CASCADE;
CREATE TABLE logica_home.C9 AS SELECT
  C6.x AS x
FROM
  logica_home.C6 AS C6
WHERE
  (C6.x != 9) AND
  (C6.x != 8) AND
  (C6.x != 7);

-- Interacting with table logica_home.C9

DROP TABLE IF EXISTS logica_home.C12 CASCADE;
CREATE TABLE logica_home.C12 AS SELECT
  C9.x AS x
FROM
  logica_home.C9 AS C9
WHERE
  (C9.x != 12) AND
  (C9.x != 11) AND
  (C9.x != 10);

-- Interacting with table logica_home.C12

DROP TABLE IF EXISTS logica_home.C15 CASCADE;
CREATE TABLE logica_home.C15 AS SELECT
  C12.x AS x
FROM
  logica_home.C12 AS C12
WHERE
  (C12.x != 15) AND
  (C12.x != 14) AND
  (C12.x != 13);

-- Interacting with table logica_home.C15

DROP TABLE IF EXISTS logica_home.C18 CASCADE;
CREATE TABLE logica_home.C18 AS SELECT
  C15.x AS x
FROM
  logica_home.C15 AS C15
WHERE
  (C15.x != 18) AND
  (C15.x != 17) AND
  (C15.x != 16);

-- Interacting with table logica_home.C18

SELECT
  C18.x AS x
FROM
  logica_home.C18 AS C18;