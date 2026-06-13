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
WITH t_0_Items AS (SELECT * FROM (
  
    SELECT
      'apple' AS col0,
      'fruit' AS col1,
      1.50 AS col2
   UNION ALL
  
    SELECT
      'banana' AS col0,
      'fruit' AS col1,
      0.75 AS col2
   UNION ALL
  
    SELECT
      'carrot' AS col0,
      'vegetable' AS col1,
      0.50 AS col2
   UNION ALL
  
    SELECT
      'milk' AS col0,
      'dairy' AS col1,
      2.00 AS col2
   UNION ALL
  
    SELECT
      'bread' AS col0,
      'grain' AS col1,
      1.25 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Items.col0 AS name,
  Items.col2 AS price
FROM
  t_0_Items AS Items, UNNEST(ARRAY['fruit', 'vegetable']::text[]) as x_9
WHERE
  (Items.col1 = x_9) ORDER BY name;