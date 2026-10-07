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

-- Logica type: logicarecord197515364
drop type if exists logicarecord197515364 cascade; create type logicarecord197515364 as struct(city text, dept text, salary numeric);
WITH t_0_Emp AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      'eng' AS dept,
      7000 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'bob' AS name,
      'eng' AS dept,
      5200 AS salary,
      'lyon' AS city
   UNION ALL
  
    SELECT
      'cid' AS name,
      'ops' AS dept,
      4100 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'dan' AS name,
      'ops' AS dept,
      3900 AS salary,
      'nice' AS city
   UNION ALL
  
    SELECT
      'eve' AS name,
      'sales' AS dept,
      6100 AS salary,
      'lyon' AS city
   UNION ALL
  
    SELECT
      'fay' AS name,
      'sales' AS dept,
      2800 AS salary,
      'paris' AS city
   UNION ALL
  
    SELECT
      'gus' AS name,
      'hr' AS dept,
      4500 AS salary,
      'nice' AS city
   UNION ALL
  
    SELECT
      'hal' AS name,
      'eng' AS dept,
      9100 AS salary,
      'nice' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Emp.dept AS dept,
  Emp.salary AS salary,
  Emp.city AS city
FROM
  t_0_Emp AS Emp
WHERE
  ('ann' = Emp.name);