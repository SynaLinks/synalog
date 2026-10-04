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
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      1 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_K AS (SELECT
  R.k AS k
FROM
  t_1_R AS R
GROUP BY R.k),
t_2_Loud AS (SELECT
  t_3_R.k AS k
FROM
  t_1_R AS t_3_R
WHERE
  (t_3_R.v > 5)
GROUP BY t_3_R.k)
SELECT
  K.k AS k
FROM
  t_0_K AS K
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_2_Loud AS Loud, UNNEST(ARRAY[0]::numeric[]) as x_6
  WHERE
    (Loud.k = K.k)) AS numeric) IS NULL) ORDER BY k;