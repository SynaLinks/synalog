-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord829297287
drop type if exists logicarecord829297287 cascade; create type logicarecord829297287 as struct(a text, b numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      {a: 'x', b: 1} AS r
   UNION ALL
  
    SELECT
      2 AS k,
      {a: null, b: 2} AS r
   UNION ALL
  
    SELECT
      3 AS k,
      {a: 'z', b: null} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.k AS k,
  N.r.b AS b
FROM
  t_0_N AS N ORDER BY k;