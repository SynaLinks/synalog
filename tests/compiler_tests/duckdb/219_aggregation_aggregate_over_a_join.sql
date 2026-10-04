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
  (O.pid = P.id)
GROUP BY P.name ORDER BY name;