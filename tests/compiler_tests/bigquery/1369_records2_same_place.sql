WITH t_2_Emp AS (SELECT * FROM (
  
    SELECT
      "ann" AS name,
      "eng" AS dept,
      7000 AS salary,
      "paris" AS city
   UNION ALL
  
    SELECT
      "bob" AS name,
      "eng" AS dept,
      5200 AS salary,
      "lyon" AS city
   UNION ALL
  
    SELECT
      "cid" AS name,
      "ops" AS dept,
      4100 AS salary,
      "paris" AS city
   UNION ALL
  
    SELECT
      "dan" AS name,
      "ops" AS dept,
      3900 AS salary,
      "nice" AS city
   UNION ALL
  
    SELECT
      "eve" AS name,
      "sales" AS dept,
      6100 AS salary,
      "lyon" AS city
   UNION ALL
  
    SELECT
      "fay" AS name,
      "sales" AS dept,
      2800 AS salary,
      "paris" AS city
   UNION ALL
  
    SELECT
      "gus" AS name,
      "hr" AS dept,
      4500 AS salary,
      "nice" AS city
   UNION ALL
  
    SELECT
      "hal" AS name,
      "eng" AS dept,
      9100 AS salary,
      "nice" AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Emp.name AS a,
  t_1_Emp.name AS b
FROM
  t_2_Emp AS Emp, t_2_Emp AS t_1_Emp
WHERE
  (Emp.name < t_1_Emp.name) AND
  (STRUCT(t_1_Emp.dept AS dept, t_1_Emp.city AS city) = STRUCT(Emp.dept AS dept, Emp.city AS city));