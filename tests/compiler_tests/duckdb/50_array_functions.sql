-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Lists AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      [1, 2]::numeric[] AS a,
      [3, 4]::numeric[] AS b
   UNION ALL
  
    SELECT
      2 AS id,
      [5]::numeric[] AS a,
      [6, 7, 8]::numeric[] AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Concatenated AS (SELECT
  Lists.id AS id,
  LEN(ARRAY_CONCAT(Lists.a, Lists.b)) AS total_size,
  array_extract(ARRAY_CONCAT(Lists.a, Lists.b),  CAST(0+1 AS BIGINT)) AS head
FROM
  t_1_Lists AS Lists ORDER BY id)
SELECT
  Concatenated.id AS id,
  Concatenated.total_size AS total_size,
  Concatenated.head AS head
FROM
  t_0_Concatenated AS Concatenated ORDER BY id;