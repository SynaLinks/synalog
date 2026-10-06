-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      0.25E0 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      0.5E0 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      0.5E0 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_0_R AS R
GROUP BY R.k ORDER BY k;