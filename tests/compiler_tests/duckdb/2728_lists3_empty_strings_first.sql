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
WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ['a', 'b']::text[] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      []::text[] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  array_extract(S.l,  CAST(0+1 AS BIGINT)) AS e
FROM
  t_0_S AS S ORDER BY k;