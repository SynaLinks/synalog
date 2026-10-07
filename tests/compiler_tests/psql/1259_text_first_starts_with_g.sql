-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Customer AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Ada' AS first,
      'Lovelace' AS last,
      'ada@analytical.org' AS email
   UNION ALL
  
    SELECT
      2 AS id,
      'alan' AS first,
      'TURING' AS last,
      'alan@bletchley.uk' AS email
   UNION ALL
  
    SELECT
      3 AS id,
      'Grace' AS first,
      'Hopper' AS last,
      'grace@navy.mil' AS email
   UNION ALL
  
    SELECT
      4 AS id,
      'Edsger' AS first,
      'Dijkstra' AS last,
      'ewd@utexas.edu' AS email
   UNION ALL
  
    SELECT
      5 AS id,
      'Barbara' AS first,
      'Liskov' AS last,
      'liskov@mit.edu' AS email
   UNION ALL
  
    SELECT
      6 AS id,
      'Ken' AS first,
      'Thompson' AS last,
      'ken@bell-labs.com' AS email
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Customer.id AS id
FROM
  t_0_Customer AS Customer
WHERE
  (LOWER(Customer.first) LIKE 'g%' ESCAPE '\');
