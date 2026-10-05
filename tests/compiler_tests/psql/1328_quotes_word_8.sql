-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'it''s' AS w
   UNION ALL
  
    SELECT
      2 AS id,
      'say "hi"' AS w
   UNION ALL
  
    SELECT
      3 AS id,
      'café' AS w
   UNION ALL
  
    SELECT
      4 AS id,
      'naïve' AS w
   UNION ALL
  
    SELECT
      5 AS id,
      'a\b' AS w
   UNION ALL
  
    SELECT
      6 AS id,
      '50%' AS w
   UNION ALL
  
    SELECT
      7 AS id,
      'o''neil' AS w
   UNION ALL
  
    SELECT
      8 AS id,
      'x_y' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.w AS w
FROM
  t_1_W AS t_0_W
WHERE
  (t_0_W.id = 8);
