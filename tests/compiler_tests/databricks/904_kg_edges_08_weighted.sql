WITH t_2_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_1_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_2_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_4_Clients AS (SELECT * FROM VALUES
  (100, "acme"),
  (200, "globex")
AS UNUSED_TABLE_NAME(client_id, client)),
t_3_Client AS (SELECT
  Clients.client_id AS client_id,
  Clients.client AS client
FROM
  t_4_Clients AS Clients
GROUP BY 1, 2 ORDER BY client_id NULLS LAST),
t_5_Orders AS (SELECT * FROM VALUES
  (1, 100, 5),
  (1, 100, 7),
  (2, 200, 3),
  (4, 100, 1)
AS UNUSED_TABLE_NAME(person_id, client_id, amount))
SELECT
  Person.person_id AS person_id,
  t_0_Client.client_id AS client_id,
  SUM(Orders.amount) AS total
FROM
  t_1_Person AS Person, t_3_Client AS t_0_Client, t_5_Orders AS Orders
WHERE
  (Orders.person_id = Person.person_id) AND
  (Orders.client_id = t_0_Client.client_id)
GROUP BY 1, 2 ORDER BY person_id NULLS LAST, client_id NULLS LAST;