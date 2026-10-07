-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Data AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      'Alice' AS col1,
      'alice@example.com' AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'Bob' AS col1,
      CAST(null AS text) AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      CAST(null AS text) AS col1,
      'charlie@example.com' AS col2
   UNION ALL
  
    SELECT
      4 AS col0,
      CAST(null AS text) AS col1,
      CAST(null AS text) AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Data.col0 AS id,
  COALESCE(Data.col1, 'Unknown') AS display_name
FROM
  t_0_Data AS Data ORDER BY id;