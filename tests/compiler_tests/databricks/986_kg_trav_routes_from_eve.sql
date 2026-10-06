DROP TABLE IF EXISTS logica_test.PathTo_sn_delta;
CREATE TABLE logica_test.PathTo_sn_delta AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_0_PathTo_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_2_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_2_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_2_Person.person_id)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  PathTo_MultBodyAggAux_f1.source AS source,
  PathTo_MultBodyAggAux_f1.target AS target,
  PathTo_MultBodyAggAux_f1.path AS path
FROM
  t_0_PathTo_MultBodyAggAux_f1 AS PathTo_MultBodyAggAux_f1
GROUP BY 1, 2, 3;

-- Interacting with table logica_test.PathTo_sn_delta

DROP TABLE IF EXISTS logica_test.PathTo_sn_t0;
CREATE TABLE logica_test.PathTo_sn_t0 AS SELECT
  PathTo_sn_delta.source AS source,
  PathTo_sn_delta.target AS target,
  PathTo_sn_delta.path AS path
FROM
  logica_test.PathTo_sn_delta AS PathTo_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.PathTo_sn_t0

DROP TABLE IF EXISTS logica_test.PathTo_sn_t1;
CREATE TABLE logica_test.PathTo_sn_t1 AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_t0.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t0.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_t0 AS PathTo_sn_t0, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_t0.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_r1 AS (SELECT
  PathTo_MultBodyAggAux_f2.source AS source,
  PathTo_MultBodyAggAux_f2.target AS target,
  PathTo_MultBodyAggAux_f2.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f2 AS PathTo_MultBodyAggAux_f2
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_r1.source AS source,
  PathTo_sn_r1.target AS target,
  PathTo_sn_r1.path AS path
FROM
  t_0_PathTo_sn_r1 AS PathTo_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.PathTo_sn_t1

DROP TABLE IF EXISTS logica_test.PathTo_sn_t2;
CREATE TABLE logica_test.PathTo_sn_t2 AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_t1.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t1.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_t1 AS PathTo_sn_t1, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_t1.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_r2 AS (SELECT
  PathTo_MultBodyAggAux_f3.source AS source,
  PathTo_MultBodyAggAux_f3.target AS target,
  PathTo_MultBodyAggAux_f3.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f3 AS PathTo_MultBodyAggAux_f3
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_r2.source AS source,
  PathTo_sn_r2.target AS target,
  PathTo_sn_r2.path AS path
FROM
  t_0_PathTo_sn_r2 AS PathTo_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.PathTo_sn_t2

DROP TABLE IF EXISTS logica_test.PathTo_sn_t3;
CREATE TABLE logica_test.PathTo_sn_t3 AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_t2.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t2.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_t2 AS PathTo_sn_t2, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_t2.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_r3 AS (SELECT
  PathTo_MultBodyAggAux_f4.source AS source,
  PathTo_MultBodyAggAux_f4.target AS target,
  PathTo_MultBodyAggAux_f4.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f4 AS PathTo_MultBodyAggAux_f4
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_r3.source AS source,
  PathTo_sn_r3.target AS target,
  PathTo_sn_r3.path AS path
FROM
  t_0_PathTo_sn_r3 AS PathTo_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.PathTo_sn_t3

DROP TABLE IF EXISTS logica_test.PathTo_sn_t4;
CREATE TABLE logica_test.PathTo_sn_t4 AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_t3.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t3.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_t3 AS PathTo_sn_t3, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_t3.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_r4 AS (SELECT
  PathTo_MultBodyAggAux_f5.source AS source,
  PathTo_MultBodyAggAux_f5.target AS target,
  PathTo_MultBodyAggAux_f5.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f5 AS PathTo_MultBodyAggAux_f5
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_r4.source AS source,
  PathTo_sn_r4.target AS target,
  PathTo_sn_r4.path AS path
FROM
  t_0_PathTo_sn_r4 AS PathTo_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.PathTo_sn_t4

DROP TABLE IF EXISTS logica_test.PathTo_sn_t5;
CREATE TABLE logica_test.PathTo_sn_t5 AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_t4.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t4.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_t4 AS PathTo_sn_t4, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_t4.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_r5 AS (SELECT
  PathTo_MultBodyAggAux_f6.source AS source,
  PathTo_MultBodyAggAux_f6.target AS target,
  PathTo_MultBodyAggAux_f6.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f6 AS PathTo_MultBodyAggAux_f6
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_r5.source AS source,
  PathTo_sn_r5.target AS target,
  PathTo_sn_r5.path AS path
FROM
  t_0_PathTo_sn_r5 AS PathTo_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.PathTo_sn_t5

DROP TABLE IF EXISTS logica_test.PathTo_sn_t6;
CREATE TABLE logica_test.PathTo_sn_t6 AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_t5.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t5.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_t5 AS PathTo_sn_t5, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_t5.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_r6 AS (SELECT
  PathTo_MultBodyAggAux_f7.source AS source,
  PathTo_MultBodyAggAux_f7.target AS target,
  PathTo_MultBodyAggAux_f7.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f7 AS PathTo_MultBodyAggAux_f7
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_r6.source AS source,
  PathTo_sn_r6.target AS target,
  PathTo_sn_r6.path AS path
FROM
  t_0_PathTo_sn_r6 AS PathTo_sn_r6
WHERE
  (1 = 0);

-- Interacting with table logica_test.PathTo_sn_t6

DROP TABLE IF EXISTS logica_test.PathTo_sn_t7;
CREATE TABLE logica_test.PathTo_sn_t7 AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_t6.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t6.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_t6 AS PathTo_sn_t6, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_t6.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_r7 AS (SELECT
  PathTo_MultBodyAggAux_f8.source AS source,
  PathTo_MultBodyAggAux_f8.target AS target,
  PathTo_MultBodyAggAux_f8.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f8 AS PathTo_MultBodyAggAux_f8
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_r7.source AS source,
  PathTo_sn_r7.target AS target,
  PathTo_sn_r7.path AS path
FROM
  t_0_PathTo_sn_r7 AS PathTo_sn_r7
WHERE
  (1 = 0);

-- Interacting with table logica_test.PathTo_sn_t7

DROP TABLE IF EXISTS logica_test.PathTo_sn_full;
CREATE TABLE logica_test.PathTo_sn_full AS SELECT * FROM (
  
    SELECT
      PathTo_sn_delta.source AS source,
      PathTo_sn_delta.target AS target,
      PathTo_sn_delta.path AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta
   UNION ALL
  
    SELECT
      PathTo_sn_t1.source AS source,
      PathTo_sn_t1.target AS target,
      PathTo_sn_t1.path AS path
    FROM
      logica_test.PathTo_sn_t1 AS PathTo_sn_t1
   UNION ALL
  
    SELECT
      PathTo_sn_t2.source AS source,
      PathTo_sn_t2.target AS target,
      PathTo_sn_t2.path AS path
    FROM
      logica_test.PathTo_sn_t2 AS PathTo_sn_t2
   UNION ALL
  
    SELECT
      PathTo_sn_t3.source AS source,
      PathTo_sn_t3.target AS target,
      PathTo_sn_t3.path AS path
    FROM
      logica_test.PathTo_sn_t3 AS PathTo_sn_t3
   UNION ALL
  
    SELECT
      PathTo_sn_t4.source AS source,
      PathTo_sn_t4.target AS target,
      PathTo_sn_t4.path AS path
    FROM
      logica_test.PathTo_sn_t4 AS PathTo_sn_t4
   UNION ALL
  
    SELECT
      PathTo_sn_t5.source AS source,
      PathTo_sn_t5.target AS target,
      PathTo_sn_t5.path AS path
    FROM
      logica_test.PathTo_sn_t5 AS PathTo_sn_t5
   UNION ALL
  
    SELECT
      PathTo_sn_t6.source AS source,
      PathTo_sn_t6.target AS target,
      PathTo_sn_t6.path AS path
    FROM
      logica_test.PathTo_sn_t6 AS PathTo_sn_t6
   UNION ALL
  
    SELECT
      PathTo_sn_t7.source AS source,
      PathTo_sn_t7.target AS target,
      PathTo_sn_t7.path AS path
    FROM
      logica_test.PathTo_sn_t7 AS PathTo_sn_t7
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.PathTo_sn_full

DROP TABLE IF EXISTS logica_test.PathTo_sn_new;
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_delta.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_delta.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_delta.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f9.source AS source,
  PathTo_MultBodyAggAux_f9.target AS target,
  PathTo_MultBodyAggAux_f9.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f9 AS PathTo_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_step.source AS source,
  PathTo_sn_step.target AS target,
  PathTo_sn_step.path AS path
FROM
  t_0_PathTo_sn_step AS PathTo_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.PathTo_sn_full AS PathTo_sn_full
  WHERE
    (PathTo_sn_full.source = PathTo_sn_step.source) AND
    (PathTo_sn_full.target = PathTo_sn_step.target) AND
    (PathTo_sn_full.path = PathTo_sn_step.path)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.PathTo_sn_full SELECT * FROM logica_test.PathTo_sn_new;

DROP TABLE IF EXISTS logica_test.PathTo_sn_delta;
CREATE TABLE logica_test.PathTo_sn_delta AS SELECT
  PathTo_sn_new.source AS source,
  PathTo_sn_new.target AS target,
  PathTo_sn_new.path AS path
FROM
  logica_test.PathTo_sn_new AS PathTo_sn_new;

DROP TABLE IF EXISTS logica_test.PathTo_sn_new;
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_delta.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_delta.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_delta.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f9.source AS source,
  PathTo_MultBodyAggAux_f9.target AS target,
  PathTo_MultBodyAggAux_f9.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f9 AS PathTo_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_step.source AS source,
  PathTo_sn_step.target AS target,
  PathTo_sn_step.path AS path
FROM
  t_0_PathTo_sn_step AS PathTo_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.PathTo_sn_full AS PathTo_sn_full
  WHERE
    (PathTo_sn_full.source = PathTo_sn_step.source) AND
    (PathTo_sn_full.target = PathTo_sn_step.target) AND
    (PathTo_sn_full.path = PathTo_sn_step.path)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.PathTo_sn_full SELECT * FROM logica_test.PathTo_sn_new;

DROP TABLE IF EXISTS logica_test.PathTo_sn_delta;
CREATE TABLE logica_test.PathTo_sn_delta AS SELECT
  PathTo_sn_new.source AS source,
  PathTo_sn_new.target AS target,
  PathTo_sn_new.path AS path
FROM
  logica_test.PathTo_sn_new AS PathTo_sn_new;

DROP TABLE IF EXISTS logica_test.PathTo_sn_new;
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_delta.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_delta.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_delta.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f9.source AS source,
  PathTo_MultBodyAggAux_f9.target AS target,
  PathTo_MultBodyAggAux_f9.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f9 AS PathTo_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_step.source AS source,
  PathTo_sn_step.target AS target,
  PathTo_sn_step.path AS path
FROM
  t_0_PathTo_sn_step AS PathTo_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.PathTo_sn_full AS PathTo_sn_full
  WHERE
    (PathTo_sn_full.source = PathTo_sn_step.source) AND
    (PathTo_sn_full.target = PathTo_sn_step.target) AND
    (PathTo_sn_full.path = PathTo_sn_step.path)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.PathTo_sn_full SELECT * FROM logica_test.PathTo_sn_new;

DROP TABLE IF EXISTS logica_test.PathTo_sn_delta;
CREATE TABLE logica_test.PathTo_sn_delta AS SELECT
  PathTo_sn_new.source AS source,
  PathTo_sn_new.target AS target,
  PathTo_sn_new.path AS path
FROM
  logica_test.PathTo_sn_new AS PathTo_sn_new;

DROP TABLE IF EXISTS logica_test.PathTo_sn_new;
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_9_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_3_Manages AS (SELECT
  t_4_Person.person_id AS manager_id,
  t_5_Person.person_id AS employee_id
FROM
  t_6_Person AS t_4_Person, t_6_Person AS t_5_Person, t_9_Management AS Management
WHERE
  (Management.manager_id = t_4_Person.person_id) AND
  (Management.employee_id = t_5_Person.person_id)
GROUP BY 1, 2),
t_1_PathTo_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(Person.name, " > ")), t_3_Person.name)) AS path
    FROM
      t_3_Manages AS Manages, t_6_Person AS Person, t_6_Person AS t_3_Person
    WHERE
      (Manages.manager_id = Person.person_id) AND
      (Manages.employee_id = t_3_Person.person_id)
   UNION ALL
  
    SELECT
      PathTo_sn_delta.source AS source,
      t_6_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_delta.path, " > ")), t_8_Person.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta, t_3_Manages AS t_6_Manages, t_6_Person AS t_8_Person
    WHERE
      (t_6_Manages.manager_id = PathTo_sn_delta.target) AND
      (t_6_Manages.employee_id = t_8_Person.person_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f9.source AS source,
  PathTo_MultBodyAggAux_f9.target AS target,
  PathTo_MultBodyAggAux_f9.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f9 AS PathTo_MultBodyAggAux_f9
GROUP BY 1, 2, 3)
SELECT
  PathTo_sn_step.source AS source,
  PathTo_sn_step.target AS target,
  PathTo_sn_step.path AS path
FROM
  t_0_PathTo_sn_step AS PathTo_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.PathTo_sn_full AS PathTo_sn_full
  WHERE
    (PathTo_sn_full.source = PathTo_sn_step.source) AND
    (PathTo_sn_full.target = PathTo_sn_step.target) AND
    (PathTo_sn_full.path = PathTo_sn_step.path)) IS NULL)
GROUP BY 1, 2, 3;

INSERT INTO logica_test.PathTo_sn_full SELECT * FROM logica_test.PathTo_sn_new;

DROP TABLE IF EXISTS logica_test.PathTo_sn_delta;
CREATE TABLE logica_test.PathTo_sn_delta AS SELECT
  PathTo_sn_new.source AS source,
  PathTo_sn_new.target AS target,
  PathTo_sn_new.path AS path
FROM
  logica_test.PathTo_sn_new AS PathTo_sn_new;

WITH t_7_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_6_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_7_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST)
SELECT
  Person.name AS target,
  PathTo_sn_full.path AS path
FROM
  logica_test.PathTo_sn_full AS PathTo_sn_full, t_6_Person AS Person
WHERE
  (Person.person_id = PathTo_sn_full.target) AND
  (5 = PathTo_sn_full.source)
GROUP BY 1, 2 ORDER BY target NULLS LAST, path NULLS LAST;