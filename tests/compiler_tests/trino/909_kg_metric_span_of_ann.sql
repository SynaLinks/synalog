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

DROP TABLE IF EXISTS logica_test.Below_sn_delta;
CREATE TABLE logica_test.Below_sn_delta AS WITH t_0_Below_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_1_Manages.manager_id AS manager_id,
      t_1_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_1_Manages
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Below_MultBodyAggAux_f2.manager_id AS manager_id,
  Below_MultBodyAggAux_f2.employee_id AS employee_id
FROM
  t_0_Below_MultBodyAggAux_f2 AS Below_MultBodyAggAux_f2
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
CREATE TABLE logica_test.Below_sn_t1 AS WITH t_1_Below_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t0.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t0 AS Below_sn_t0, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t0.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r1 AS (SELECT
  Below_MultBodyAggAux_f3.manager_id AS manager_id,
  Below_MultBodyAggAux_f3.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f3 AS Below_MultBodyAggAux_f3
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
CREATE TABLE logica_test.Below_sn_t2 AS WITH t_1_Below_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t1.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t1 AS Below_sn_t1, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t1.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r2 AS (SELECT
  Below_MultBodyAggAux_f4.manager_id AS manager_id,
  Below_MultBodyAggAux_f4.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f4 AS Below_MultBodyAggAux_f4
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
CREATE TABLE logica_test.Below_sn_t3 AS WITH t_1_Below_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t2.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t2 AS Below_sn_t2, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t2.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r3 AS (SELECT
  Below_MultBodyAggAux_f5.manager_id AS manager_id,
  Below_MultBodyAggAux_f5.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f5 AS Below_MultBodyAggAux_f5
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
CREATE TABLE logica_test.Below_sn_t4 AS WITH t_1_Below_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t3.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t3 AS Below_sn_t3, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t3.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r4 AS (SELECT
  Below_MultBodyAggAux_f6.manager_id AS manager_id,
  Below_MultBodyAggAux_f6.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f6 AS Below_MultBodyAggAux_f6
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
CREATE TABLE logica_test.Below_sn_t5 AS WITH t_1_Below_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Below_sn_t4.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_t4 AS Below_sn_t4, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_t4.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_r5 AS (SELECT
  Below_MultBodyAggAux_f7.manager_id AS manager_id,
  Below_MultBodyAggAux_f7.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f7 AS Below_MultBodyAggAux_f7
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
CREATE TABLE logica_test.Below_sn_new AS WITH t_1_Below_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f8.manager_id AS manager_id,
  Below_MultBodyAggAux_f8.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f8 AS Below_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Below_sn_delta AS WITH t_1_Below_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Below_sn_new.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_new AS Below_sn_new, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_new.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_back_step AS (SELECT
  Below_MultBodyAggAux_f1.manager_id AS manager_id,
  Below_MultBodyAggAux_f1.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f1 AS Below_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Below_sn_back_step.manager_id AS manager_id,
  Below_sn_back_step.employee_id AS employee_id
FROM
  t_0_Below_sn_back_step AS Below_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_back_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_back_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_delta;

DROP TABLE IF EXISTS logica_test.Below_sn_new;
CREATE TABLE logica_test.Below_sn_new AS WITH t_1_Below_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f8.manager_id AS manager_id,
  Below_MultBodyAggAux_f8.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f8 AS Below_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Below_sn_delta AS WITH t_1_Below_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Below_sn_new.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_new AS Below_sn_new, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_new.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_back_step AS (SELECT
  Below_MultBodyAggAux_f1.manager_id AS manager_id,
  Below_MultBodyAggAux_f1.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f1 AS Below_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Below_sn_back_step.manager_id AS manager_id,
  Below_sn_back_step.employee_id AS employee_id
FROM
  t_0_Below_sn_back_step AS Below_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_back_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_back_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_delta;

DROP TABLE IF EXISTS logica_test.Below_sn_new;
CREATE TABLE logica_test.Below_sn_new AS WITH t_1_Below_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      Below_sn_delta.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_delta AS Below_sn_delta, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_delta.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_step AS (SELECT
  Below_MultBodyAggAux_f8.manager_id AS manager_id,
  Below_MultBodyAggAux_f8.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f8 AS Below_MultBodyAggAux_f8
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
CREATE TABLE logica_test.Below_sn_delta AS WITH t_1_Below_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Below_sn_new.manager_id AS manager_id,
      Manages.employee_id AS employee_id
    FROM
      logica_test.Below_sn_new AS Below_sn_new, logica_test.Manages AS Manages
    WHERE
      (Manages.manager_id = Below_sn_new.employee_id)
   UNION ALL
  
    SELECT
      t_2_Manages.manager_id AS manager_id,
      t_2_Manages.employee_id AS employee_id
    FROM
      logica_test.Manages AS t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Below_sn_back_step AS (SELECT
  Below_MultBodyAggAux_f1.manager_id AS manager_id,
  Below_MultBodyAggAux_f1.employee_id AS employee_id
FROM
  t_1_Below_MultBodyAggAux_f1 AS Below_MultBodyAggAux_f1
GROUP BY 1, 2)
SELECT
  Below_sn_back_step.manager_id AS manager_id,
  Below_sn_back_step.employee_id AS employee_id
FROM
  t_0_Below_sn_back_step AS Below_sn_back_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Below_sn_full AS Below_sn_full
  WHERE
    (Below_sn_full.manager_id = Below_sn_back_step.manager_id) AND
    (Below_sn_full.employee_id = Below_sn_back_step.employee_id)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Below_sn_full SELECT * FROM logica_test.Below_sn_delta;

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