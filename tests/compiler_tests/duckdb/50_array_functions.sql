-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Lists AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      [1, 2] AS a,
      [3, 4] AS b
   UNION ALL
  
    SELECT
      2 AS id,
      [5] AS a,
      [6, 7, 8] AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Concatenated AS (SELECT
  Lists.id AS id,
  LEN(ARRAY_CONCAT(Lists.a, Lists.b)) AS total_size,
  (CASE WHEN 0 < 0 THEN NULL ELSE array_extract(ARRAY_CONCAT(Lists.a, Lists.b), CAST(0 + 1 AS BIGINT)) END) AS head
FROM
  t_1_Lists AS Lists ORDER BY id)
SELECT
  Concatenated.id AS id,
  Concatenated.total_size AS total_size,
  Concatenated.head AS head
FROM
  t_0_Concatenated AS Concatenated ORDER BY id;