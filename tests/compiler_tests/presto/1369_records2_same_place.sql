DROP TABLE IF EXISTS logica_test.Place;
CREATE TABLE logica_test.Place AS WITH t_0_Emp AS (SELECT * FROM (
  
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
  Emp.name AS name,
  CAST(ROW(Emp.city, Emp.dept) AS ROW(city varchar, dept varchar)) AS p
FROM
  t_0_Emp AS Emp;

-- Interacting with table logica_test.Place

SELECT
  Place.name AS a,
  t_0_Place.name AS b
FROM
  logica_test.Place AS Place, logica_test.Place AS t_0_Place
WHERE
  (Place.name < t_0_Place.name) AND
  (t_0_Place.p = Place.p);
