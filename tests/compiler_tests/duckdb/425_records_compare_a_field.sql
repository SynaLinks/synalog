-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord881570680
drop type if exists logicarecord881570680 cascade; create type logicarecord881570680 as struct(k numeric, s text);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      {k: 1, s: 'a'} AS r
   UNION ALL
  
    SELECT
      {k: 2, s: 'b'} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.r.s AS s
FROM
  t_0_V AS V
WHERE
  (V.r.k > 1);