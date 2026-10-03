-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_Rows AS (SELECT * FROM (
  
    SELECT
      'a,b,c' AS line
   UNION ALL
  
    SELECT
      'x,y' AS line
  
) AS UNUSED_TABLE_NAME  ),
t_0_Parsed AS (SELECT
  t_1_Rows.line AS line,
  COALESCE(ARRAY_LENGTH(STRING_TO_ARRAY(t_1_Rows.line, ','), 1), 0) AS n,
  (STRING_TO_ARRAY(t_1_Rows.line, ','))[0 + 1] AS first
FROM
  t_2_Rows AS t_1_Rows ORDER BY line)
SELECT
  Parsed.line AS line,
  Parsed.n AS n,
  Parsed.first AS first
FROM
  t_0_Parsed AS Parsed ORDER BY line;