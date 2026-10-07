-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      {name: 'a', xs: [{v: 1}, {v: 2}]} AS r
   UNION ALL
  
    SELECT
      {name: 'b', xs: [{v: 5}]} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.r.name AS name,
  x_1.unnested_pod.v AS v
FROM
  t_1_R AS t_0_R, (select unnest(t_0_R.r.xs) as unnested_pod) as x_1 ORDER BY name, v;