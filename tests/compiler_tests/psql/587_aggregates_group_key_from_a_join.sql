-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Sale AS (SELECT * FROM (
  
    SELECT
      'fr' AS c,
      10 AS x
   UNION ALL
  
    SELECT
      'de' AS c,
      20 AS x
   UNION ALL
  
    SELECT
      'ca' AS c,
      5 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_Region AS (SELECT * FROM (
  
    SELECT
      'fr' AS c,
      'eu' AS r
   UNION ALL
  
    SELECT
      'de' AS c,
      'eu' AS r
   UNION ALL
  
    SELECT
      'ca' AS c,
      'us' AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Region.r AS r,
  SUM(Sale.x) AS t
FROM
  t_0_Sale AS Sale, t_1_Region AS Region
WHERE
  (COALESCE(Region.c, '') = COALESCE(Sale.c, '') AND (Region.c IS NULL) = (Sale.c IS NULL))
GROUP BY Region.r ORDER BY r;