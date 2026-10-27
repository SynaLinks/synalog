-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_1_O AS (SELECT * FROM (
  
    SELECT
      1 AS pid,
      10 AS amount
   UNION ALL
  
    SELECT
      1 AS pid,
      20 AS amount
   UNION ALL
  
    SELECT
      2 AS pid,
      5 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.name AS name,
  SUM(O.amount) AS total
FROM
  t_0_P AS P, t_1_O AS O
WHERE
  (O.pid IS NOT DISTINCT FROM P.id)
GROUP BY P.name ORDER BY name;