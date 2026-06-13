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
WITH t_0_Raw AS (SELECT * FROM (
  
    SELECT
      1 AS v
   UNION ALL
  
    SELECT
      2 AS v
   UNION ALL
  
    SELECT
      3 AS v
   UNION ALL
  
    SELECT
      4 AS v
   UNION ALL
  
    SELECT
      5 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Raw.v AS v,
  ((Raw.v) * (2)) AS doubled,
  ((((Raw.v) * (2))) + (10)) AS plus_ten
FROM
  t_0_Raw AS Raw
WHERE
  (Raw.v > 2) ORDER BY v;