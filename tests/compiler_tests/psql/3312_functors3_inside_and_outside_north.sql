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
WITH t_2_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'north' AS region,
      'tea' AS product,
      120 AS amount
   UNION ALL
  
    SELECT
      2 AS id,
      'north' AS region,
      'cake' AS product,
      40 AS amount
   UNION ALL
  
    SELECT
      3 AS id,
      'south' AS region,
      'tea' AS product,
      75 AS amount
   UNION ALL
  
    SELECT
      4 AS id,
      'south' AS region,
      'coffee' AS product,
      210 AS amount
   UNION ALL
  
    SELECT
      5 AS id,
      'east' AS region,
      'cake' AS product,
      55 AS amount
   UNION ALL
  
    SELECT
      6 AS id,
      'east' AS region,
      'tea' AS product,
      130 AS amount
   UNION ALL
  
    SELECT
      7 AS id,
      'north' AS region,
      'coffee' AS product,
      95 AS amount
   UNION ALL
  
    SELECT
      8 AS id,
      'south' AS region,
      'cake' AS product,
      20 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_I AS (SELECT
  SUM(Sale.amount) AS t
FROM
  t_2_Sale AS Sale, t_2_Sale AS t_1_Sale
WHERE
  (t_1_Sale.region = 'north') AND
  (Sale.id = t_1_Sale.id)),
t_3_O AS (SELECT
  SUM(t_4_Sale.amount) AS t
FROM
  t_2_Sale AS t_4_Sale
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_15 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_2_Sale AS t_6_Sale, UNNEST(ARRAY[0]::numeric[]) as x_15
  WHERE
    (t_6_Sale.region = 'north') AND
    (t_4_Sale.id = t_6_Sale.id)) AS numeric) IS NULL))
SELECT
  I.t AS inside,
  O.t AS outside
FROM
  t_0_I AS I, t_3_O AS O;