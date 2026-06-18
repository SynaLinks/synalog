-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord14709893005794985916') then create type logicarecord14709893005794985916 as ("email" text, "phone" text); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord255234925354388218') then create type logicarecord255234925354388218 as ("contact" logicarecord14709893005794985916, "name" text); end if; END $$;
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ROW(ROW('alice@example.com', '123')::logicarecord14709893005794985916, 'Alice')::logicarecord255234925354388218 AS info
   UNION ALL
  
    SELECT
      2 AS id,
      ROW(ROW('bob@example.com', '456')::logicarecord14709893005794985916, 'Bob')::logicarecord255234925354388218 AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id,
  (Person.info).name AS name,
  ((Person.info).contact).email AS email
FROM
  t_0_Person AS Person ORDER BY id;