-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Items AS (SELECT * FROM (
  
    SELECT
      'apple' AS col0,
      'fruit' AS col1,
      CAST(1.50 AS double precision) AS col2
   UNION ALL
  
    SELECT
      'banana' AS col0,
      'fruit' AS col1,
      CAST(0.75 AS double precision) AS col2
   UNION ALL
  
    SELECT
      'carrot' AS col0,
      'vegetable' AS col1,
      CAST(0.50 AS double precision) AS col2
   UNION ALL
  
    SELECT
      'milk' AS col0,
      'dairy' AS col1,
      CAST(2.00 AS double precision) AS col2
   UNION ALL
  
    SELECT
      'bread' AS col0,
      'grain' AS col1,
      CAST(1.25 AS double precision) AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Items.col0 AS name,
  Items.col2 AS price
FROM
  t_0_Items AS Items, UNNEST(ARRAY['fruit', 'vegetable']) as x_9
WHERE
  (Items.col1 = x_9) ORDER BY name;