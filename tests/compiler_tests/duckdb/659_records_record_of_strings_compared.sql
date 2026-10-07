-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      {k: 'a', v: 'x'} AS r
   UNION ALL
  
    SELECT
      {k: 'b', v: 'y'} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.r.v AS v
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.r.k = 'b');