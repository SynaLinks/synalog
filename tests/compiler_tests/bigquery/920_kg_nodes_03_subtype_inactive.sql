WITH t_2_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      "ann" AS name,
      "eng" AS dept,
      10 AS team_id,
      "active" AS status,
      "https://x/ann" AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      "bob" AS name,
      "eng" AS dept,
      10 AS team_id,
      "active" AS status,
      "https://x/bob" AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      "cid" AS name,
      "ops" AS dept,
      20 AS team_id,
      "inactive" AS status,
      "https://x/cid" AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      "dan" AS name,
      "ops" AS dept,
      20 AS team_id,
      "active" AS status,
      "https://x/dan" AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      "eve" AS name,
      "eng" AS dept,
      30 AS team_id,
      "active" AS status,
      "https://x/eve" AS url
  
) AS UNUSED_TABLE_NAME  ),
t_0_Person AS (SELECT
  t_1_Employees.person_id AS person_id,
  t_1_Employees.name AS name,
  t_1_Employees.url AS url
FROM
  t_2_Employees AS t_1_Employees
GROUP BY person_id, name, url ORDER BY person_id)
SELECT
  Person.person_id AS person_id,
  Person.name AS name
FROM
  t_0_Person AS Person, t_2_Employees AS Employees
WHERE
  (Employees.person_id = Person.person_id) AND
  (Employees.status = "inactive")
GROUP BY person_id, name ORDER BY person_id;