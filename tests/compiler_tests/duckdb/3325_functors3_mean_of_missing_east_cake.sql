-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG(Sale.amount) AS m
FROM
  t_1_Sale AS t_0_Sale, t_1_Sale AS Sale
WHERE
  ((SELECT
    MIN((CASE WHEN x_14.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_Sale AS t_2_Sale, (select unnest([0]) as unnested_pod) as x_14
  WHERE
    (t_2_Sale.product = 'cake') AND
    (Sale.id IS NOT DISTINCT FROM t_2_Sale.id)) IS NULL) AND
  (t_0_Sale.region = 'east') AND
  (Sale.id IS NOT DISTINCT FROM t_0_Sale.id);