-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Event AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2025-12-30 23:15:00' AS "at",
      'login' AS kind,
      'ana' AS "user"
   UNION ALL
  
    SELECT
      2 AS id,
      '2026-01-02 08:05:30' AS "at",
      'buy' AS kind,
      'ana' AS "user"
   UNION ALL
  
    SELECT
      3 AS id,
      '2026-01-15 12:00:00' AS "at",
      'login' AS kind,
      'ben' AS "user"
   UNION ALL
  
    SELECT
      4 AS id,
      '2026-02-01 00:00:01' AS "at",
      'buy' AS kind,
      'ben' AS "user"
   UNION ALL
  
    SELECT
      5 AS id,
      '2026-02-14 18:45:10' AS "at",
      'buy' AS kind,
      'ana' AS "user"
   UNION ALL
  
    SELECT
      6 AS id,
      '2026-02-28 23:59:59' AS "at",
      'login' AS kind,
      'cy' AS "user"
   UNION ALL
  
    SELECT
      7 AS id,
      '2026-03-01 06:30:00' AS "at",
      'buy' AS kind,
      'cy' AS "user"
   UNION ALL
  
    SELECT
      8 AS id,
      '2026-03-15 14:20:00' AS "at",
      'refund' AS kind,
      'ana' AS "user"
   UNION ALL
  
    SELECT
      9 AS id,
      '2026-03-31 09:00:00' AS "at",
      'login' AS kind,
      'ben' AS "user"
   UNION ALL
  
    SELECT
      10 AS id,
      '2026-04-01 10:10:10' AS "at",
      'buy' AS kind,
      'ben' AS "user"
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Event.id AS id
    FROM
      t_1_Event AS Event
    WHERE
      (CAST(SUBSTR(Event."at", 12, 2) AS BIGINT) >= 23)
   UNION ALL
  
    SELECT
      t_2_Event.id AS id
    FROM
      t_1_Event AS t_2_Event
    WHERE
      (CAST(SUBSTR(t_2_Event."at", 12, 2) AS BIGINT) < 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.id AS id
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY Q_MultBodyAggAux.id ORDER BY id;
