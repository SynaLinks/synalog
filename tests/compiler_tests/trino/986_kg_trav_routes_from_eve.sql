DROP TABLE IF EXISTS logica_test.Person;
CREATE TABLE logica_test.Person AS WITH t_0_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      'ann' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/ann' AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      'bob' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/bob' AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      'cid' AS name,
      'ops' AS dept,
      20 AS team_id,
      'inactive' AS status,
      'https://x/cid' AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      'dan' AS name,
      'ops' AS dept,
      20 AS team_id,
      'active' AS status,
      'https://x/dan' AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      'eve' AS name,
      'eng' AS dept,
      30 AS team_id,
      'active' AS status,
      'https://x/eve' AS url
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Employees.person_id AS person_id,
  Employees.name AS name,
  Employees.url AS url
FROM
  t_0_Employees AS Employees
GROUP BY 1, 2, 3 ORDER BY person_id;

-- Interacting with table logica_test.Person

DROP TABLE IF EXISTS logica_test.Manages;
CREATE TABLE logica_test.Manages AS WITH t_1_Management AS (SELECT * FROM (
  
    SELECT
      1 AS manager_id,
      2 AS employee_id
   UNION ALL
  
    SELECT
      1 AS manager_id,
      5 AS employee_id
   UNION ALL
  
    SELECT
      4 AS manager_id,
      3 AS employee_id
   UNION ALL
  
    SELECT
      2 AS manager_id,
      6 AS employee_id
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.person_id AS manager_id,
  t_0_Person.person_id AS employee_id
FROM
  logica_test.Person AS Person, logica_test.Person AS t_0_Person, t_1_Management AS Management
WHERE
  (Management.manager_id = Person.person_id) AND
  (Management.employee_id = t_0_Person.person_id)
GROUP BY 1, 2;

-- Interacting with table logica_test.Manages

DROP TABLE IF EXISTS logica_test.N;
CREATE TABLE logica_test.N AS SELECT
  Person.person_id AS person_id,
  Person.name AS name
FROM
  logica_test.Person AS Person;

-- Interacting with table logica_test.N

DROP TABLE IF EXISTS logica_test.PathTo_sn_delta;
CREATE TABLE logica_test.PathTo_sn_delta AS WITH t_0_PathTo_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(N.name, ' > ')), t_1_N.name)) AS path
    FROM
      logica_test.Manages AS Manages, logica_test.N AS N, logica_test.N AS t_1_N
    WHERE
      (N.person_id = Manages.manager_id) AND
      (t_1_N.person_id = Manages.employee_id)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  PathTo_MultBodyAggAux_f1.source AS source,
  PathTo_MultBodyAggAux_f1.target AS target,
  PathTo_MultBodyAggAux_f1.path AS path
FROM
  t_0_PathTo_MultBodyAggAux_f1 AS PathTo_MultBodyAggAux_f1
GROUP BY 1, 2, 3;

-- Interacting with table logica_test.PathTo_sn_delta

DROP TABLE IF EXISTS logica_test.PathTo_sn_full;
CREATE TABLE logica_test.PathTo_sn_full AS WITH t_1_PathTo_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(N.name, ' > ')), t_2_N.name)) AS path
    FROM
      logica_test.Manages AS Manages, logica_test.N AS N, logica_test.N AS t_2_N
    WHERE
      (N.person_id = Manages.manager_id) AND
      (t_2_N.person_id = Manages.employee_id)
   UNION ALL
  
    SELECT
      t_3_PathTo_sn_delta.source AS source,
      t_4_Manages.employee_id AS target,
      (CONCAT((CONCAT(t_3_PathTo_sn_delta.path, ' > ')), t_5_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS t_3_PathTo_sn_delta, logica_test.Manages AS t_4_Manages, logica_test.N AS t_5_N
    WHERE
      (t_4_Manages.manager_id = t_3_PathTo_sn_delta.target) AND
      (t_5_N.person_id = t_4_Manages.employee_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f2.source AS source,
  PathTo_MultBodyAggAux_f2.target AS target,
  PathTo_MultBodyAggAux_f2.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f2 AS PathTo_MultBodyAggAux_f2
GROUP BY 1, 2, 3)
SELECT * FROM (
  
    SELECT
      PathTo_sn_delta.source AS source,
      PathTo_sn_delta.target AS target,
      PathTo_sn_delta.path AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta
   UNION ALL
  
    SELECT
      PathTo_sn_step.source AS source,
      PathTo_sn_step.target AS target,
      PathTo_sn_step.path AS path
    FROM
      t_0_PathTo_sn_step AS PathTo_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.PathTo_sn_full

DROP TABLE IF EXISTS logica_test.PathTo_sn_new;
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_1_PathTo_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(N.name, ' > ')), t_2_N.name)) AS path
    FROM
      logica_test.Manages AS Manages, logica_test.N AS N, logica_test.N AS t_2_N
    WHERE
      (N.person_id = Manages.manager_id) AND
      (t_2_N.person_id = Manages.employee_id)
   UNION ALL
  
    SELECT
      t_3_PathTo_sn_delta.source AS source,
      t_4_Manages.employee_id AS target,
      (CONCAT((CONCAT(t_3_PathTo_sn_delta.path, ' > ')), t_5_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS t_3_PathTo_sn_delta, logica_test.Manages AS t_4_Manages, logica_test.N AS t_5_N
    WHERE
      (t_4_Manages.manager_id = t_3_PathTo_sn_delta.target) AND
      (t_5_N.person_id = t_4_Manages.employee_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f2.source AS source,
  PathTo_MultBodyAggAux_f2.target AS target,
  PathTo_MultBodyAggAux_f2.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f2 AS PathTo_MultBodyAggAux_f2
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
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_1_PathTo_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(N.name, ' > ')), t_2_N.name)) AS path
    FROM
      logica_test.Manages AS Manages, logica_test.N AS N, logica_test.N AS t_2_N
    WHERE
      (N.person_id = Manages.manager_id) AND
      (t_2_N.person_id = Manages.employee_id)
   UNION ALL
  
    SELECT
      t_3_PathTo_sn_delta.source AS source,
      t_4_Manages.employee_id AS target,
      (CONCAT((CONCAT(t_3_PathTo_sn_delta.path, ' > ')), t_5_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS t_3_PathTo_sn_delta, logica_test.Manages AS t_4_Manages, logica_test.N AS t_5_N
    WHERE
      (t_4_Manages.manager_id = t_3_PathTo_sn_delta.target) AND
      (t_5_N.person_id = t_4_Manages.employee_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f2.source AS source,
  PathTo_MultBodyAggAux_f2.target AS target,
  PathTo_MultBodyAggAux_f2.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f2 AS PathTo_MultBodyAggAux_f2
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
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_1_PathTo_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(N.name, ' > ')), t_2_N.name)) AS path
    FROM
      logica_test.Manages AS Manages, logica_test.N AS N, logica_test.N AS t_2_N
    WHERE
      (N.person_id = Manages.manager_id) AND
      (t_2_N.person_id = Manages.employee_id)
   UNION ALL
  
    SELECT
      t_3_PathTo_sn_delta.source AS source,
      t_4_Manages.employee_id AS target,
      (CONCAT((CONCAT(t_3_PathTo_sn_delta.path, ' > ')), t_5_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS t_3_PathTo_sn_delta, logica_test.Manages AS t_4_Manages, logica_test.N AS t_5_N
    WHERE
      (t_4_Manages.manager_id = t_3_PathTo_sn_delta.target) AND
      (t_5_N.person_id = t_4_Manages.employee_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f2.source AS source,
  PathTo_MultBodyAggAux_f2.target AS target,
  PathTo_MultBodyAggAux_f2.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f2 AS PathTo_MultBodyAggAux_f2
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
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_1_PathTo_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Manages.manager_id AS source,
      Manages.employee_id AS target,
      (CONCAT((CONCAT(N.name, ' > ')), t_2_N.name)) AS path
    FROM
      logica_test.Manages AS Manages, logica_test.N AS N, logica_test.N AS t_2_N
    WHERE
      (N.person_id = Manages.manager_id) AND
      (t_2_N.person_id = Manages.employee_id)
   UNION ALL
  
    SELECT
      t_3_PathTo_sn_delta.source AS source,
      t_4_Manages.employee_id AS target,
      (CONCAT((CONCAT(t_3_PathTo_sn_delta.path, ' > ')), t_5_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS t_3_PathTo_sn_delta, logica_test.Manages AS t_4_Manages, logica_test.N AS t_5_N
    WHERE
      (t_4_Manages.manager_id = t_3_PathTo_sn_delta.target) AND
      (t_5_N.person_id = t_4_Manages.employee_id)
  
) AS UNUSED_TABLE_NAME  ),
t_0_PathTo_sn_step AS (SELECT
  PathTo_MultBodyAggAux_f2.source AS source,
  PathTo_MultBodyAggAux_f2.target AS target,
  PathTo_MultBodyAggAux_f2.path AS path
FROM
  t_1_PathTo_MultBodyAggAux_f2 AS PathTo_MultBodyAggAux_f2
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

SELECT
  N.name AS target,
  PathTo_sn_full.path AS path
FROM
  logica_test.PathTo_sn_full AS PathTo_sn_full, logica_test.N AS N
WHERE
  (5 = PathTo_sn_full.source) AND
  (N.person_id = PathTo_sn_full.target)
GROUP BY 1, 2 ORDER BY target, path;