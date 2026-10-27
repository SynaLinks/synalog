-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
  (t_1_Sale.product = 'cake') AND
  (Sale.id IS NOT DISTINCT FROM t_1_Sale.id)),
t_3_O AS (SELECT
  SUM(t_4_Sale.amount) AS t
FROM
  t_2_Sale AS t_4_Sale
WHERE
  ((SELECT
    MIN((CASE WHEN x_15.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_2_Sale AS t_6_Sale, (select unnest([0]) as unnested_pod) as x_15
  WHERE
    (t_6_Sale.product = 'cake') AND
    (t_4_Sale.id IS NOT DISTINCT FROM t_6_Sale.id)) IS NULL))
SELECT
  I.t AS inside,
  O.t AS outside
FROM
  t_0_I AS I, t_3_O AS O;