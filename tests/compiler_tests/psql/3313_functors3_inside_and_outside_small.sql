-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
  (t_1_Sale.amount < 60) AND
  (COALESCE(Sale.id, 0) = COALESCE(t_1_Sale.id, 0) AND (Sale.id IS NULL) = (t_1_Sale.id IS NULL))),
t_3_O AS (SELECT
  SUM(t_4_Sale.amount) AS t
FROM
  t_2_Sale AS t_4_Sale
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_14 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_2_Sale AS t_6_Sale, UNNEST(ARRAY[0]) as x_14
  WHERE
    (t_6_Sale.amount < 60) AND
    (COALESCE(t_4_Sale.id, 0) = COALESCE(t_6_Sale.id, 0) AND (t_4_Sale.id IS NULL) = (t_6_Sale.id IS NULL))) AS numeric) IS NULL))
SELECT
  I.t AS inside,
  O.t AS outside
FROM
  t_0_I AS I, t_3_O AS O;