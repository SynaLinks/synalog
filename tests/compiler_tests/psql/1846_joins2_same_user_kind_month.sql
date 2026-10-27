-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Event.id AS a,
  t_0_Event.id AS b
FROM
  t_1_Event AS Event, t_1_Event AS t_0_Event
WHERE
  (Event.id < t_0_Event.id) AND
  (COALESCE(t_0_Event.kind, '') = COALESCE(Event.kind, '') AND (t_0_Event.kind IS NULL) = (Event.kind IS NULL)) AND
  (COALESCE(t_0_Event."user", '') = COALESCE(Event."user", '') AND (t_0_Event."user" IS NULL) = (Event."user" IS NULL)) AND
  (COALESCE(SUBSTR(Event."at", 1, 7), '') = COALESCE(SUBSTR(t_0_Event."at", 1, 7), '') AND (SUBSTR(Event."at", 1, 7) IS NULL) = (SUBSTR(t_0_Event."at", 1, 7) IS NULL));
