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
WITH t_0_Book AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'The Hobbit' AS title,
      'tolkien' AS author,
      1937 AS year
   UNION ALL
  
    SELECT
      2 AS id,
      'The Fellowship' AS title,
      'tolkien' AS author,
      1954 AS year
   UNION ALL
  
    SELECT
      3 AS id,
      'The Two Towers' AS title,
      'tolkien' AS author,
      1954 AS year
   UNION ALL
  
    SELECT
      4 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year
   UNION ALL
  
    SELECT
      5 AS id,
      'Dune Messiah' AS title,
      'herbert' AS author,
      1969 AS year
   UNION ALL
  
    SELECT
      6 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year
   UNION ALL
  
    SELECT
      7 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year
   UNION ALL
  
    SELECT
      8 AS id,
      'Neuromancer' AS title,
      'gibson' AS author,
      1984 AS year
   UNION ALL
  
    SELECT
      9 AS id,
      'Count Zero' AS title,
      'gibson' AS author,
      1986 AS year
   UNION ALL
  
    SELECT
      10 AS id,
      'Foundation' AS title,
      'asimov' AS author,
      1951 AS year
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Book.id AS id,
  Book.title AS title
FROM
  t_0_Book AS Book ORDER BY id;