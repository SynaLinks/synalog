-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'oslo' AS shop,
      '2026-01-03' AS day,
      'tea' AS product,
      2 AS qty,
      CAST(3.5 AS double precision) AS price
   UNION ALL
  
    SELECT
      2 AS id,
      'oslo' AS shop,
      '2026-01-17' AS day,
      'cake' AS product,
      CAST(null AS numeric) AS qty,
      CAST(4.0 AS double precision) AS price
   UNION ALL
  
    SELECT
      3 AS id,
      'rome' AS shop,
      '2026-02-02' AS day,
      'tea' AS product,
      5 AS qty,
      CAST(3.0 AS double precision) AS price
   UNION ALL
  
    SELECT
      4 AS id,
      'rome' AS shop,
      '2026-02-11' AS day,
      'coffee' AS product,
      1 AS qty,
      CAST(2.5 AS double precision) AS price
   UNION ALL
  
    SELECT
      5 AS id,
      'rome' AS shop,
      '2026-03-09' AS day,
      'cake' AS product,
      3 AS qty,
      CAST(4.5 AS double precision) AS price
   UNION ALL
  
    SELECT
      6 AS id,
      'lima' AS shop,
      '2026-03-21' AS day,
      'coffee' AS product,
      4 AS qty,
      CAST(2.0 AS double precision) AS price
   UNION ALL
  
    SELECT
      7 AS id,
      'lima' AS shop,
      '2026-01-30' AS day,
      'tea' AS product,
      CAST(null AS numeric) AS qty,
      CAST(3.25 AS double precision) AS price
   UNION ALL
  
    SELECT
      8 AS id,
      'oslo' AS shop,
      '2026-03-02' AS day,
      'coffee' AS product,
      6 AS qty,
      CAST(2.75 AS double precision) AS price
   UNION ALL
  
    SELECT
      9 AS id,
      'lima' AS shop,
      '2026-02-14' AS day,
      'cake' AS product,
      2 AS qty,
      CAST(5.0 AS double precision) AS price
  
) AS UNUSED_TABLE_NAME  )
SELECT
  COUNT(DISTINCT S.product) AS n
FROM
  t_0_S AS S
WHERE
  (S.shop = 'rome');