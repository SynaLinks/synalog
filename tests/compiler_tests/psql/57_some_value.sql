-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_1_Readings AS (SELECT * FROM (
  
    SELECT
      's1' AS sensor,
      'C' AS unit,
      20 AS value
   UNION ALL
  
    SELECT
      's1' AS sensor,
      'C' AS unit,
      22 AS value
   UNION ALL
  
    SELECT
      's2' AS sensor,
      'F' AS unit,
      70 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_SensorUnit AS (SELECT
  Readings.sensor AS sensor,
  MIN(Readings.unit) AS unit,
  SUM(Readings.value) AS total
FROM
  t_1_Readings AS Readings
GROUP BY Readings.sensor ORDER BY sensor)
SELECT
  SensorUnit.sensor AS sensor,
  SensorUnit.unit AS unit,
  SensorUnit.total AS total
FROM
  t_0_SensorUnit AS SensorUnit ORDER BY sensor;