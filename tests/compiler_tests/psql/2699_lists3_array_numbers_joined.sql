-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_I AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'pen' AS item,
      CAST(2.5 AS double precision) AS price,
      3 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'ink' AS item,
      CAST(7.0 AS double precision) AS price,
      1 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      2 AS "order",
      'ann' AS customer,
      'pad' AS item,
      CAST(4.0 AS double precision) AS price,
      2 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'pen' AS item,
      CAST(2.5 AS double precision) AS price,
      10 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'cap' AS item,
      CAST(1.25 AS double precision) AS price,
      4 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'ink' AS item,
      CAST(7.0 AS double precision) AS price,
      2 AS qty,
      3 AS pos
   UNION ALL
  
    SELECT
      4 AS "order",
      'cid' AS customer,
      'pad' AS item,
      CAST(4.0 AS double precision) AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      CAST(2.5 AS double precision) AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      CAST(2.5 AS double precision) AS price,
      2 AS qty,
      2 AS pos
  
) AS UNUSED_TABLE_NAME  ),
t_0_A AS (SELECT
  I."order" AS "order",
  ARRAY_AGG((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(CAST(synalog_v AS numeric)) < 0.0000000000000005 THEN '0' WHEN CAST(synalog_v AS numeric) = FLOOR(CAST(synalog_v AS numeric)) AND ABS(CAST(synalog_v AS numeric)) < 1e18 THEN CAST(CAST(CAST(synalog_v AS numeric) AS BIGINT) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e38 THEN CAST(CAST(synalog_v AS numeric) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e15 THEN CAST(ROUND(CAST(CAST(synalog_v AS numeric) AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS TEXT) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(synalog_v AS numeric), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS TEXT))) END) FROM (SELECT I.qty AS synalog_v) AS synalog_n) order by I.pos) AS l
FROM
  t_3_I AS I
GROUP BY I."order")
SELECT
  A."order" AS "order",
  ARRAY_TO_STRING(A.l, ';') AS s
FROM
  t_0_A AS A ORDER BY "order", s;