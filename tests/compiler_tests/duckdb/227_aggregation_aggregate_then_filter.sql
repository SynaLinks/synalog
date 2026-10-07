-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      20 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_T AS (SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_2_R AS R
GROUP BY R.k)
SELECT
  t_0_T.k AS k
FROM
  t_1_T AS t_0_T
WHERE
  (t_0_T.t > 10) ORDER BY k;