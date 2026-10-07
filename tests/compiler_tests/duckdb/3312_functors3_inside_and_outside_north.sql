-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
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
  ((SELECT
    MIN((CASE WHEN x_15.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_2_Sale AS t_6_Sale, (select unnest([0]::numeric[]) as unnested_pod) as x_15
  WHERE
    (t_6_Sale.region = 'north') AND
    (t_4_Sale.id = t_6_Sale.id)) IS NULL))
SELECT
  I.t AS inside,
  O.t AS outside
FROM
  t_0_I AS I, t_3_O AS O;