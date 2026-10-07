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
      1 AS id,
      'Ann' AS name,
      'red' AS team,
      34 AS age,
      true AS active
   UNION ALL
  
    SELECT
      2 AS id,
      'Bob' AS name,
      'red' AS team,
      null AS age,
      false AS active
   UNION ALL
  
    SELECT
      3 AS id,
      'Cid' AS name,
      'blue' AS team,
      52 AS age,
      true AS active
   UNION ALL
  
    SELECT
      4 AS id,
      'Dee' AS name,
      'blue' AS team,
      23 AS age,
      false AS active
   UNION ALL
  
    SELECT
      5 AS id,
      'Eve' AS name,
      'green' AS team,
      41 AS age,
      null AS active
   UNION ALL
  
    SELECT
      6 AS id,
      'Fay' AS name,
      'red' AS team,
      19 AS age,
      true AS active
   UNION ALL
  
    SELECT
      7 AS id,
      'Gus' AS name,
      'gold' AS team,
      60 AS age,
      false AS active
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id
FROM
  t_0_Person AS Person, (select unnest(['red']::text[]) as unnested_pod) as x_3
WHERE
  (Person.team = x_3.unnested_pod) ORDER BY id;