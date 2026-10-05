-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS s
   UNION ALL
  
    SELECT
      'b' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_J AS (SELECT
  GROUP_CONCAT(V.s) AS j
FROM
  t_2_V AS V)
SELECT
  LEN(SPLIT(t_0_J.j, ',')) AS parts,
  LENGTH(t_0_J.j) AS length
FROM
  t_1_J AS t_0_J;