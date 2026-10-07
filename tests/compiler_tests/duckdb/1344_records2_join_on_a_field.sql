-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Emp AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_2_Floor AS (SELECT * FROM (
  
    SELECT
      'eng' AS dept,
      3 AS floor
   UNION ALL
  
    SELECT
      'ops' AS dept,
      1 AS floor
   UNION ALL
  
    SELECT
      'sales' AS dept,
      2 AS floor
   UNION ALL
  
    SELECT
      'hr' AS dept,
      1 AS floor
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Emp.name AS name,
  t_0_Floor.floor AS floor
FROM
  t_1_Emp AS Emp, t_2_Floor AS t_0_Floor
WHERE
  (t_0_Floor.dept = Emp.dept) ORDER BY name, floor;
