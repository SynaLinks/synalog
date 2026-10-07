-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      'ada' AS name,
      'ada@analytical.org' AS email
   UNION ALL
  
    SELECT
      'ken' AS name,
      'ken@bell-labs.com' AS email
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.name AS name,
  (CASE WHEN ((LEN(SPLIT(E.email, '.'))) - (1)) < 0 THEN NULL ELSE array_extract(SPLIT(E.email, '.'), CAST(((LEN(SPLIT(E.email, '.'))) - (1)) + 1 AS BIGINT)) END) AS tld
FROM
  t_0_E AS E ORDER BY name;