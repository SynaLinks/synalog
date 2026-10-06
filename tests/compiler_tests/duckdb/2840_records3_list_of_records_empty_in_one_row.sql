-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord918648522
drop type if exists logicarecord918648522 cascade; create type logicarecord918648522 as struct(n text);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [{n: 'a'}]::logicarecord918648522[] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      []::logicarecord918648522[] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  LEN(T.l) AS s
FROM
  t_0_T AS T ORDER BY k;