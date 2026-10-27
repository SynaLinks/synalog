-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      3 AS k,
      'c' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.k AS k,
  B.v AS v
FROM
  t_0_B AS B, (select unnest([1, 2, 3]) as unnested_pod) as x_6
WHERE
  (B.k > 1) AND
  (B.v IS DISTINCT FROM 'c') AND
  (x_6.unnested_pod IS NOT DISTINCT FROM B.k);