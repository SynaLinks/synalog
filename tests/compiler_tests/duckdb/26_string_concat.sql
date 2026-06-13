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
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      E'John' AS col0,
      E'Doe' AS col1
   UNION ALL
  
    SELECT
      E'Jane' AS col0,
      E'Smith' AS col1
   UNION ALL
  
    SELECT
      E'Bob' AS col0,
      E'' AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.col0 AS first,
  Person.col1 AS last,
  ((((Person.col0) || (E' '))) || (Person.col1)) AS full_name
FROM
  t_0_Person AS Person ORDER BY full_name;