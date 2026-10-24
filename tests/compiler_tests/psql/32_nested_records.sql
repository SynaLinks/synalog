-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord14212448856759781937') then create type synalogrecord14212448856759781937 as ("email" text, "phone" text); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord9125840858436097033') then create type synalogrecord9125840858436097033 as ("contact" synalogrecord14212448856759781937, "name" text); end if; END $$;
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ROW(ROW('alice@example.com', '123')::synalogrecord14212448856759781937, 'Alice')::synalogrecord9125840858436097033 AS info
   UNION ALL
  
    SELECT
      2 AS id,
      ROW(ROW('bob@example.com', '456')::synalogrecord14212448856759781937, 'Bob')::synalogrecord9125840858436097033 AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id,
  (Person.info).name AS name,
  ((Person.info).contact).email AS email
FROM
  t_0_Person AS Person ORDER BY id;