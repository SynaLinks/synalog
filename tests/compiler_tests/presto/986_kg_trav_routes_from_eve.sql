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
CREATE TABLE logica_test.PathTo_sn_t1 AS WITH t_1_PathTo_MultBodyAggAux_f2 AS (SELECT * FROM (
  
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
      PathTo_sn_t0.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t0.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_t0 AS PathTo_sn_t0, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_t0.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_t2 AS WITH t_1_PathTo_MultBodyAggAux_f3 AS (SELECT * FROM (
  
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
      PathTo_sn_t1.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t1.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_t1 AS PathTo_sn_t1, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_t1.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_t3 AS WITH t_1_PathTo_MultBodyAggAux_f4 AS (SELECT * FROM (
  
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
      PathTo_sn_t2.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t2.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_t2 AS PathTo_sn_t2, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_t2.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_t4 AS WITH t_1_PathTo_MultBodyAggAux_f5 AS (SELECT * FROM (
  
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
      PathTo_sn_t3.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t3.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_t3 AS PathTo_sn_t3, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_t3.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_t5 AS WITH t_1_PathTo_MultBodyAggAux_f6 AS (SELECT * FROM (
  
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
      PathTo_sn_t4.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t4.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_t4 AS PathTo_sn_t4, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_t4.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_t6 AS WITH t_1_PathTo_MultBodyAggAux_f7 AS (SELECT * FROM (
  
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
      PathTo_sn_t5.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t5.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_t5 AS PathTo_sn_t5, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_t5.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_t7 AS WITH t_1_PathTo_MultBodyAggAux_f8 AS (SELECT * FROM (
  
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
      PathTo_sn_t6.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_t6.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_t6 AS PathTo_sn_t6, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_t6.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_1_PathTo_MultBodyAggAux_f9 AS (SELECT * FROM (
  
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
      PathTo_sn_delta.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_delta.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_delta.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_1_PathTo_MultBodyAggAux_f9 AS (SELECT * FROM (
  
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
      PathTo_sn_delta.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_delta.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_delta.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_1_PathTo_MultBodyAggAux_f9 AS (SELECT * FROM (
  
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
      PathTo_sn_delta.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_delta.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_delta.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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
CREATE TABLE logica_test.PathTo_sn_new AS WITH t_1_PathTo_MultBodyAggAux_f9 AS (SELECT * FROM (
  
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
      PathTo_sn_delta.source AS source,
      t_3_Manages.employee_id AS target,
      (CONCAT((CONCAT(PathTo_sn_delta.path, ' > ')), t_4_N.name)) AS path
    FROM
      logica_test.PathTo_sn_delta AS PathTo_sn_delta, logica_test.Manages AS t_3_Manages, logica_test.N AS t_4_N
    WHERE
      (t_3_Manages.manager_id = PathTo_sn_delta.target) AND
      (t_4_N.person_id = t_3_Manages.employee_id)
  
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

SELECT
  N.name AS target,
  PathTo_sn_full.path AS path
FROM
  logica_test.PathTo_sn_full AS PathTo_sn_full, logica_test.N AS N
WHERE
  (5 = PathTo_sn_full.source) AND
  (N.person_id = PathTo_sn_full.target)
GROUP BY 1, 2 ORDER BY target, path;