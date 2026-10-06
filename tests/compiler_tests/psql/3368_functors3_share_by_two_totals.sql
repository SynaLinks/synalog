-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Sale AS (SELECT * FROM (
  
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
t_0_Tt AS (SELECT
  SUM(Sale.amount) AS t
FROM
  t_1_Sale AS Sale
WHERE
  (Sale.product = 'tea')),
t_2_Ta AS (SELECT
  SUM(t_4_Sale.amount) AS t
FROM
  t_1_Sale AS t_4_Sale)
SELECT
  (CAST(Tt.t AS double precision) / NULLIF(Ta.t, 0)) AS share
FROM
  t_0_Tt AS Tt, t_2_Ta AS Ta;