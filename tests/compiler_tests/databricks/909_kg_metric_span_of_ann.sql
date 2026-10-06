DROP TABLE IF EXISTS logica_test.Below_sn_delta;
CREATE TABLE logica_test.Below_sn_delta AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_0_Below_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_Manages.manager_id AS manager_id,
      t_1_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_1_Manages
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Below_MultBodyAggAux_f1.manager_id AS manager_id,
  Below_MultBodyAggAux_f1.employee_id AS employee_id
FROM
  t_0_Below_MultBodyAggAux_f1 AS Below_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Below_sn_delta

DROP TABLE IF EXISTS logica_test.Below_sn_t0;
CREATE TABLE logica_test.Below_sn_t0 AS SELECT
  Below_sn_delta.manager_id AS manager_id,
  Below_sn_delta.employee_id AS employee_id
FROM
  logica_test.Below_sn_delta AS Below_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Below_sn_t0

DROP TABLE IF EXISTS logica_test.Below_sn_t1;
CREATE TABLE logica_test.Below_sn_t1 AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t0.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t0 AS Below_sn_t0, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t0.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r1 AS (SELECT
  Below_MultBodyAggAux_f2.manager_id AS manager_id,
  Below_MultBodyAggAux_f2.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f2 AS Below_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Below_sn_r1.manager_id AS manager_id,
  Below_sn_r1.employee_id AS employee_id
FROM
  t_0_Below_sn_r1 AS Below_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Below_sn_t1

DROP TABLE IF EXISTS logica_test.Below_sn_t2;
CREATE TABLE logica_test.Below_sn_t2 AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t1.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t1 AS Below_sn_t1, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t1.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r2 AS (SELECT
  Below_MultBodyAggAux_f3.manager_id AS manager_id,
  Below_MultBodyAggAux_f3.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f3 AS Below_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Below_sn_r2.manager_id AS manager_id,
  Below_sn_r2.employee_id AS employee_id
FROM
  t_0_Below_sn_r2 AS Below_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Below_sn_t2

DROP TABLE IF EXISTS logica_test.Below_sn_t3;
CREATE TABLE logica_test.Below_sn_t3 AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t2.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t2 AS Below_sn_t2, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t2.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r3 AS (SELECT
  Below_MultBodyAggAux_f4.manager_id AS manager_id,
  Below_MultBodyAggAux_f4.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f4 AS Below_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Below_sn_r3.manager_id AS manager_id,
  Below_sn_r3.employee_id AS employee_id
FROM
  t_0_Below_sn_r3 AS Below_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Below_sn_t3

DROP TABLE IF EXISTS logica_test.Below_sn_t4;
CREATE TABLE logica_test.Below_sn_t4 AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t3.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t3 AS Below_sn_t3, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t3.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r4 AS (SELECT
  Below_MultBodyAggAux_f5.manager_id AS manager_id,
  Below_MultBodyAggAux_f5.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f5 AS Below_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Below_sn_r4.manager_id AS manager_id,
  Below_sn_r4.employee_id AS employee_id
FROM
  t_0_Below_sn_r4 AS Below_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Below_sn_t4

DROP TABLE IF EXISTS logica_test.Below_sn_t5;
CREATE TABLE logica_test.Below_sn_t5 AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t4.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t4 AS Below_sn_t4, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t4.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r5 AS (SELECT
  Below_MultBodyAggAux_f6.manager_id AS manager_id,
  Below_MultBodyAggAux_f6.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f6 AS Below_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Below_sn_r5.manager_id AS manager_id,
  Below_sn_r5.employee_id AS employee_id
FROM
  t_0_Below_sn_r5 AS Below_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Below_sn_t5

DROP TABLE IF EXISTS logica_test.Below_sn_full;
CREATE TABLE logica_test.Below_sn_full AS SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Below_sn_delta.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta
   UNION ALL
  
    SELECT
      Below_sn_t1.manager_id AS manager_id,
      Below_sn_t1.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t1 AS Below_sn_t1
   UNION ALL
  
    SELECT
      Below_sn_t2.manager_id AS manager_id,
      Below_sn_t2.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t2 AS Below_sn_t2
   UNION ALL
  
    SELECT
      Below_sn_t3.manager_id AS manager_id,
      Below_sn_t3.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t3 AS Below_sn_t3
   UNION ALL
  
    SELECT
      Below_sn_t4.manager_id AS manager_id,
      Below_sn_t4.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t4 AS Below_sn_t4
   UNION ALL
  
    SELECT
      Below_sn_t5.manager_id AS manager_id,
      Below_sn_t5.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t5 AS Below_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Below_sn_full

DROP TABLE IF EXISTS logica_test.Below_sn_new;
CREATE TABLE logica_test.Below_sn_new AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f7.manager_id AS manager_id,
  Below_MultBodyAggAux_f7.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f7 AS Below_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Below_sn_step.manager_id AS manager_id,
  Below_sn_step.employee_id AS employee_id
FROM
  t_0_Below_sn_step AS Below_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_delta;
CREATE TABLE logica_test.Below_sn_delta AS SELECT
  Below_sn_new.manager_id AS manager_id,
  Below_sn_new.employee_id AS employee_id
FROM
  logica_test.Below_sn_new AS Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_new;
CREATE TABLE logica_test.Below_sn_new AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f7.manager_id AS manager_id,
  Below_MultBodyAggAux_f7.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f7 AS Below_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Below_sn_step.manager_id AS manager_id,
  Below_sn_step.employee_id AS employee_id
FROM
  t_0_Below_sn_step AS Below_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_delta;
CREATE TABLE logica_test.Below_sn_delta AS SELECT
  Below_sn_new.manager_id AS manager_id,
  Below_sn_new.employee_id AS employee_id
FROM
  logica_test.Below_sn_new AS Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_new;
CREATE TABLE logica_test.Below_sn_new AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f7.manager_id AS manager_id,
  Below_MultBodyAggAux_f7.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f7 AS Below_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Below_sn_step.manager_id AS manager_id,
  Below_sn_step.employee_id AS employee_id
FROM
  t_0_Below_sn_step AS Below_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_delta;
CREATE TABLE logica_test.Below_sn_delta AS SELECT
  Below_sn_new.manager_id AS manager_id,
  Below_sn_new.employee_id AS employee_id
FROM
  logica_test.Below_sn_new AS Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_new;
CREATE TABLE logica_test.Below_sn_new AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f7.manager_id AS manager_id,
  Below_MultBodyAggAux_f7.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f7 AS Below_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Below_sn_step.manager_id AS manager_id,
  Below_sn_step.employee_id AS employee_id
FROM
  t_0_Below_sn_step AS Below_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_delta;
CREATE TABLE logica_test.Below_sn_delta AS SELECT
  Below_sn_new.manager_id AS manager_id,
  Below_sn_new.employee_id AS employee_id
FROM
  logica_test.Below_sn_new AS Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_new;
CREATE TABLE logica_test.Below_sn_new AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f7.manager_id AS manager_id,
  Below_MultBodyAggAux_f7.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f7 AS Below_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Below_sn_step.manager_id AS manager_id,
  Below_sn_step.employee_id AS employee_id
FROM
  t_0_Below_sn_step AS Below_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_delta;
CREATE TABLE logica_test.Below_sn_delta AS SELECT
  Below_sn_new.manager_id AS manager_id,
  Below_sn_new.employee_id AS employee_id
FROM
  logica_test.Below_sn_new AS Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_new;
CREATE TABLE logica_test.Below_sn_new AS WITH t_5_Employees AS (SELECT * FROM VALUES
  (1, "ann", "eng", 10, "active", "https://x/ann"),
  (2, "bob", "eng", 10, "active", "https://x/bob"),
  (3, "cid", "ops", 20, "inactive", "https://x/cid"),
  (4, "dan", "ops", 20, "active", "https://x/dan"),
  (5, "eve", "eng", 30, "active", "https://x/eve")
AS UNUSED_TABLE_NAME(person_id, name, dept, team_id, status, url)),
t_4_Person AS (SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_5_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id NULLS LAST),
t_7_Management AS (SELECT * FROM VALUES
  (1, 2),
  (1, 5),
  (4, 3),
  (2, 6)
AS UNUSED_TABLE_NAME(manager_id, employee_id)),
t_2_Manages AS (SELECT
  Person.person_id AS manager_id,
  t_3_Person.person_id AS employee_id
FROM
  t_4_Person AS Person, t_4_Person AS t_3_Person, t_7_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_3_Person.person_id)
GROUP BY 1, 2),
t_1_Below_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_3_Manages.manager_id AS manager_id,
      t_3_Manages.employee_id AS employee_id
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f7.manager_id AS manager_id,
  Below_MultBodyAggAux_f7.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f7 AS Below_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Below_sn_step.manager_id AS manager_id,
  Below_sn_step.employee_id AS employee_id
FROM
  t_0_Below_sn_step AS Below_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_new;

DROP TABLE IF EXISTS logica_test.Below_sn_delta;
CREATE TABLE logica_test.Below_sn_delta AS SELECT
  Below_sn_new.manager_id AS manager_id,
  Below_sn_new.employee_id AS employee_id
FROM
  logica_test.Below_sn_new AS Below_sn_new;

WITH t_0_Count AS (SELECT
  SUM(1) AS n
FROM
  logica_test.Below_sn_full AS Below_sn_full
WHERE
  (1 = Below_sn_full.manager_id))
SELECT
  COALESCE(Count.n, 0) AS n
FROM
  t_0_Count AS Count;