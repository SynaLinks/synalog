-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      3 AS s
   UNION ALL
  
    SELECT
      'b' AS n,
      9 AS s
   UNION ALL
  
    SELECT
      'c' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'd' AS n,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  SUM((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
FROM
  t_0_V AS V, (select unnest([0]) as unnested_pod) as x_4
WHERE
  (((V.s) % NULLIF(2, 0)) = 1)) AS t;