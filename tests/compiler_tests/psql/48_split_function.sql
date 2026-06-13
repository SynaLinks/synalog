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
WITH t_1_Rows AS (SELECT * FROM (
  
    SELECT
      'a,b,c' AS line
   UNION ALL
  
    SELECT
      'x,y' AS line
  
) AS UNUSED_TABLE_NAME  ),
t_0_Parsed AS (SELECT
  Rows.line AS line,
  COALESCE(ARRAY_LENGTH(STRING_TO_ARRAY(Rows.line, ','), 1), 0) AS n,
  (STRING_TO_ARRAY(Rows.line, ','))[0 + 1] AS first
FROM
  t_1_Rows AS Rows ORDER BY line)
SELECT
  Parsed.line AS line,
  Parsed.n AS n,
  Parsed.first AS first
FROM
  t_0_Parsed AS Parsed ORDER BY line;