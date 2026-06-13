-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Events AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      E'2026-05-26' AS created
   UNION ALL
  
    SELECT
      2 AS id,
      E'2025-01-01' AS created
  
) AS UNUSED_TABLE_NAME  ),
t_0_ThisYear AS (SELECT
  Events.id AS id
FROM
  t_1_Events AS Events, CurrentDate
WHERE
  (SUBSTR(Events.created, 1, 4) = SUBSTR(CurrentDate.date, 1, 4)) ORDER BY id)
SELECT
  ThisYear.id AS id
FROM
  t_0_ThisYear AS ThisYear ORDER BY id;