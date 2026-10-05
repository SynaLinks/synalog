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
WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS k
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.n AS n
FROM
  t_0_P AS P
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_P AS t_1_P, UNNEST(ARRAY[0]::numeric[]) as x_4
  WHERE
    (P.n = t_1_P.n) AND
    (t_1_P.k = 1)) AS numeric) IS NULL);