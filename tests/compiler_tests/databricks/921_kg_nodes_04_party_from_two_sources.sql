WITH t_1_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_2_Contractors AS (SELECT * FROM VALUES
  (1, "zoe"),
  (2, "yan")
AS UNUSED_TABLE_NAME(contractor_id, name)),
t_0_Party_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      (CONCAT("employee:", CAST(Employees.person_id AS STRING))) AS party_id,
      Employees.name AS name,
      "employee" AS kind
    FROM
      t_1_Employees AS Employees
   UNION ALL
  
    SELECT
      (CONCAT("contractor:", CAST(Contractors.contractor_id AS STRING))) AS party_id,
      Contractors.name AS name,
      "contractor" AS kind
    FROM
      t_2_Contractors AS Contractors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Party_MultBodyAggAux.party_id AS party_id,
  Party_MultBodyAggAux.name AS name,
  Party_MultBodyAggAux.kind AS kind
FROM
  t_0_Party_MultBodyAggAux AS Party_MultBodyAggAux
GROUP BY 1, 2, 3 ORDER BY party_id NULLS LAST;