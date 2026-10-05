-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      30 AS age
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      null AS age
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      25 AS age
   UNION ALL
  
    SELECT
      4 AS id,
      null AS name,
      40 AS age
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      null AS age
  
) AS UNUSED_TABLE_NAME  ),
t_2_Role AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      'admin' AS role
   UNION ALL
  
    SELECT
      'cid' AS name,
      'user' AS role
   UNION ALL
  
    SELECT
      null AS name,
      'ghost' AS role
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id,
  t_0_Role.role AS role
FROM
  t_1_Person AS Person, t_2_Role AS t_0_Role
WHERE
  (t_0_Role.name = Person.name) ORDER BY id, role;
