-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord1260070555159120756') then create type logicarecord1260070555159120756 as ("l" numeric[], "n" text); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW(CAST('{}' AS numeric[]), 'a')::logicarecord1260070555159120756 AS r
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(ARRAY[7, 8], 'b')::logicarecord1260070555159120756 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  (t_0_R.r).n AS n,
  CARDINALITY((t_0_R.r).l) AS c
FROM
  t_1_R AS t_0_R ORDER BY k;