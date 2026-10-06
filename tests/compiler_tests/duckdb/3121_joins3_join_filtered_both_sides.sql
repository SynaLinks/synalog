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
WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS g,
      10 AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'a' AS g,
      20 AS v
   UNION ALL
  
    SELECT
      3 AS id,
      'b' AS g,
      null AS v
   UNION ALL
  
    SELECT
      4 AS id,
      null AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_F AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS w
   UNION ALL
  
    SELECT
      'b' AS g,
      2 AS w
   UNION ALL
  
    SELECT
      null AS g,
      3 AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.id AS id,
  F.w AS w
FROM
  t_0_E AS E, t_1_F AS F
WHERE
  (E.v > 15) AND
  (F.w < 2) AND
  (F.g = E.g);