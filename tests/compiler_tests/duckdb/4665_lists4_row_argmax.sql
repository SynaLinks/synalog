-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      [7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      [5, 5, 9, 1] AS l
   UNION ALL
  
    SELECT
      5 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  (SELECT
  argmax((CASE WHEN x_8.unnested_pod = 0 THEN {arg: x_7.unnested_pod, value: (CASE WHEN x_7.unnested_pod < 0 THEN NULL ELSE array_extract(t_0_L.l, CAST(x_7.unnested_pod + 1 AS BIGINT)) END)} ELSE NULL END).arg, (CASE WHEN x_8.unnested_pod = 0 THEN {arg: x_7.unnested_pod, value: (CASE WHEN x_7.unnested_pod < 0 THEN NULL ELSE array_extract(t_0_L.l, CAST(x_7.unnested_pod + 1 AS BIGINT)) END)} ELSE NULL END).value) AS logica_value
FROM
  (select unnest(Range(LEN(t_0_L.l))) as unnested_pod) as x_7, (select unnest([0]) as unnested_pod) as x_8) AS v
FROM
  t_2_L AS t_0_L ORDER BY k;