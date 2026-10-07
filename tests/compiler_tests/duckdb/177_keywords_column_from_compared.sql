-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      '2026-01-01' AS "from"
   UNION ALL
  
    SELECT
      '2026-02-01' AS "from"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P."from" AS "from"
FROM
  t_0_P AS P
WHERE
  (P."from" > '2026-01-15');