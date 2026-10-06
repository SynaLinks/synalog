-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2024-01-01' AS d
   UNION ALL
  
    SELECT
      2 AS id,
      '2024-02-28' AS d
   UNION ALL
  
    SELECT
      3 AS id,
      '2024-02-29' AS d
   UNION ALL
  
    SELECT
      4 AS id,
      '2023-03-01' AS d
   UNION ALL
  
    SELECT
      5 AS id,
      '2000-12-31' AS d
   UNION ALL
  
    SELECT
      6 AS id,
      '1999-07-15' AS d
   UNION ALL
  
    SELECT
      7 AS id,
      '2026-10-06' AS d
   UNION ALL
  
    SELECT
      8 AS id,
      '1970-01-01' AS d
   UNION ALL
  
    SELECT
      9 AS id,
      '2100-02-28' AS d
   UNION ALL
  
    SELECT
      10 AS id,
      '2004-08-09' AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  ((MOD(CAST(((((((((((((((365) * (((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1970))))) + (((CAST((CASE WHEN ((((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1969))) < 0) <> ((4) < 0) THEN CEIL(CAST(((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1969)) AS double precision) / NULLIF(4, 0)) ELSE FLOOR(CAST(((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1969)) AS double precision) / NULLIF(4, 0)) END) AS BIGINT)) - (CAST((CASE WHEN ((((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1901))) < 0) <> ((100) < 0) THEN CEIL(CAST(((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1901)) AS double precision) / NULLIF(100, 0)) ELSE FLOOR(CAST(((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1901)) AS double precision) / NULLIF(100, 0)) END) AS BIGINT)))))) + (CAST((CASE WHEN ((((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1601))) < 0) <> ((400) < 0) THEN CEIL(CAST(((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1601)) AS double precision) / NULLIF(400, 0)) ELSE FLOOR(CAST(((CAST(SUBSTR(V.d, 1, 4) AS BIGINT)) - (1601)) AS double precision) / NULLIF(400, 0)) END) AS BIGINT)))) + (CASE WHEN ((CAST(SUBSTR(V.d, 6, 2) AS BIGINT) > 2) AND ((((MOD(CAST(CAST(SUBSTR(V.d, 1, 4) AS BIGINT) AS numeric), NULLIF(CAST(4 AS numeric), 0))) = 0) AND ((MOD(CAST(CAST(SUBSTR(V.d, 1, 4) AS BIGINT) AS numeric), NULLIF(CAST(100 AS numeric), 0))) != 0)) OR ((MOD(CAST(CAST(SUBSTR(V.d, 1, 4) AS BIGINT) AS numeric), NULLIF(CAST(400 AS numeric), 0))) = 0))) THEN 1 ELSE 0 END))) + ((ARRAY[0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334])[((CAST(SUBSTR(V.d, 6, 2) AS BIGINT)) - (1)) + 1]))) + (((CAST(SUBSTR(V.d, 9, 2) AS BIGINT)) - (1))))) + (3)) AS numeric), NULLIF(CAST(7 AS numeric), 0))) >= 5) ORDER BY id;