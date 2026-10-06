DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      t_1_Manages.boss AS boss,
      t_1_Manages.report AS report
    FROM
      t_2_Manages AS t_1_Manages
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Under_MultBodyAggAux_f1.boss AS boss,
  Under_MultBodyAggAux_f1.report AS report
FROM
  t_0_Under_MultBodyAggAux_f1 AS Under_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Under_sn_delta

DROP TABLE IF EXISTS logica_test.Under_sn_t0;
CREATE TABLE logica_test.Under_sn_t0 AS SELECT
  Under_sn_delta.boss AS boss,
  Under_sn_delta.report AS report
FROM
  logica_test.Under_sn_delta AS Under_sn_delta
WHERE
  (1 = 0);

-- Interacting with table logica_test.Under_sn_t0

DROP TABLE IF EXISTS logica_test.Under_sn_t1;
CREATE TABLE logica_test.Under_sn_t1 AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Under_sn_t0.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_t0 AS Under_sn_t0, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_t0.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_r1 AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Under_sn_r1.boss AS boss,
  Under_sn_r1.report AS report
FROM
  t_0_Under_sn_r1 AS Under_sn_r1
WHERE
  (1 = 0);

-- Interacting with table logica_test.Under_sn_t1

DROP TABLE IF EXISTS logica_test.Under_sn_t2;
CREATE TABLE logica_test.Under_sn_t2 AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Under_sn_t1.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_t1 AS Under_sn_t1, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_t1.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_r2 AS (SELECT
  Under_MultBodyAggAux_f3.boss AS boss,
  Under_MultBodyAggAux_f3.report AS report
FROM
  t_1_Under_MultBodyAggAux_f3 AS Under_MultBodyAggAux_f3
GROUP BY 1, 2)
SELECT
  Under_sn_r2.boss AS boss,
  Under_sn_r2.report AS report
FROM
  t_0_Under_sn_r2 AS Under_sn_r2
WHERE
  (1 = 0);

-- Interacting with table logica_test.Under_sn_t2

DROP TABLE IF EXISTS logica_test.Under_sn_t3;
CREATE TABLE logica_test.Under_sn_t3 AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Under_sn_t2.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_t2 AS Under_sn_t2, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_t2.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_r3 AS (SELECT
  Under_MultBodyAggAux_f4.boss AS boss,
  Under_MultBodyAggAux_f4.report AS report
FROM
  t_1_Under_MultBodyAggAux_f4 AS Under_MultBodyAggAux_f4
GROUP BY 1, 2)
SELECT
  Under_sn_r3.boss AS boss,
  Under_sn_r3.report AS report
FROM
  t_0_Under_sn_r3 AS Under_sn_r3
WHERE
  (1 = 0);

-- Interacting with table logica_test.Under_sn_t3

DROP TABLE IF EXISTS logica_test.Under_sn_t4;
CREATE TABLE logica_test.Under_sn_t4 AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Under_sn_t3.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_t3 AS Under_sn_t3, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_t3.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_r4 AS (SELECT
  Under_MultBodyAggAux_f5.boss AS boss,
  Under_MultBodyAggAux_f5.report AS report
FROM
  t_1_Under_MultBodyAggAux_f5 AS Under_MultBodyAggAux_f5
GROUP BY 1, 2)
SELECT
  Under_sn_r4.boss AS boss,
  Under_sn_r4.report AS report
FROM
  t_0_Under_sn_r4 AS Under_sn_r4
WHERE
  (1 = 0);

-- Interacting with table logica_test.Under_sn_t4

DROP TABLE IF EXISTS logica_test.Under_sn_t5;
CREATE TABLE logica_test.Under_sn_t5 AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Under_sn_t4.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_t4 AS Under_sn_t4, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_t4.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_r5 AS (SELECT
  Under_MultBodyAggAux_f6.boss AS boss,
  Under_MultBodyAggAux_f6.report AS report
FROM
  t_1_Under_MultBodyAggAux_f6 AS Under_MultBodyAggAux_f6
GROUP BY 1, 2)
SELECT
  Under_sn_r5.boss AS boss,
  Under_sn_r5.report AS report
FROM
  t_0_Under_sn_r5 AS Under_sn_r5
WHERE
  (1 = 0);

-- Interacting with table logica_test.Under_sn_t5

DROP TABLE IF EXISTS logica_test.Under_sn_full;
CREATE TABLE logica_test.Under_sn_full AS SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Under_sn_delta.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta
   UNION ALL
  
    SELECT
      Under_sn_t1.boss AS boss,
      Under_sn_t1.report AS report
    FROM
      logica_test.Under_sn_t1 AS Under_sn_t1
   UNION ALL
  
    SELECT
      Under_sn_t2.boss AS boss,
      Under_sn_t2.report AS report
    FROM
      logica_test.Under_sn_t2 AS Under_sn_t2
   UNION ALL
  
    SELECT
      Under_sn_t3.boss AS boss,
      Under_sn_t3.report AS report
    FROM
      logica_test.Under_sn_t3 AS Under_sn_t3
   UNION ALL
  
    SELECT
      Under_sn_t4.boss AS boss,
      Under_sn_t4.report AS report
    FROM
      logica_test.Under_sn_t4 AS Under_sn_t4
   UNION ALL
  
    SELECT
      Under_sn_t5.boss AS boss,
      Under_sn_t5.report AS report
    FROM
      logica_test.Under_sn_t5 AS Under_sn_t5
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Under_sn_full

DROP TABLE IF EXISTS logica_test.Under_sn_new;
CREATE TABLE logica_test.Under_sn_new AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f7.boss AS boss,
  Under_MultBodyAggAux_f7.report AS report
FROM
  t_1_Under_MultBodyAggAux_f7 AS Under_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Under_sn_step.boss AS boss,
  Under_sn_step.report AS report
FROM
  t_0_Under_sn_step AS Under_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Under_sn_full AS Under_sn_full
  WHERE
    (Under_sn_full.boss = Under_sn_step.boss) AND
    (Under_sn_full.report = Under_sn_step.report)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Under_sn_full SELECT * FROM logica_test.Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS SELECT
  Under_sn_new.boss AS boss,
  Under_sn_new.report AS report
FROM
  logica_test.Under_sn_new AS Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_new;
CREATE TABLE logica_test.Under_sn_new AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f7.boss AS boss,
  Under_MultBodyAggAux_f7.report AS report
FROM
  t_1_Under_MultBodyAggAux_f7 AS Under_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Under_sn_step.boss AS boss,
  Under_sn_step.report AS report
FROM
  t_0_Under_sn_step AS Under_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Under_sn_full AS Under_sn_full
  WHERE
    (Under_sn_full.boss = Under_sn_step.boss) AND
    (Under_sn_full.report = Under_sn_step.report)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Under_sn_full SELECT * FROM logica_test.Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS SELECT
  Under_sn_new.boss AS boss,
  Under_sn_new.report AS report
FROM
  logica_test.Under_sn_new AS Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_new;
CREATE TABLE logica_test.Under_sn_new AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f7.boss AS boss,
  Under_MultBodyAggAux_f7.report AS report
FROM
  t_1_Under_MultBodyAggAux_f7 AS Under_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Under_sn_step.boss AS boss,
  Under_sn_step.report AS report
FROM
  t_0_Under_sn_step AS Under_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Under_sn_full AS Under_sn_full
  WHERE
    (Under_sn_full.boss = Under_sn_step.boss) AND
    (Under_sn_full.report = Under_sn_step.report)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Under_sn_full SELECT * FROM logica_test.Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS SELECT
  Under_sn_new.boss AS boss,
  Under_sn_new.report AS report
FROM
  logica_test.Under_sn_new AS Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_new;
CREATE TABLE logica_test.Under_sn_new AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f7.boss AS boss,
  Under_MultBodyAggAux_f7.report AS report
FROM
  t_1_Under_MultBodyAggAux_f7 AS Under_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Under_sn_step.boss AS boss,
  Under_sn_step.report AS report
FROM
  t_0_Under_sn_step AS Under_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Under_sn_full AS Under_sn_full
  WHERE
    (Under_sn_full.boss = Under_sn_step.boss) AND
    (Under_sn_full.report = Under_sn_step.report)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Under_sn_full SELECT * FROM logica_test.Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS SELECT
  Under_sn_new.boss AS boss,
  Under_sn_new.report AS report
FROM
  logica_test.Under_sn_new AS Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_new;
CREATE TABLE logica_test.Under_sn_new AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f7.boss AS boss,
  Under_MultBodyAggAux_f7.report AS report
FROM
  t_1_Under_MultBodyAggAux_f7 AS Under_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Under_sn_step.boss AS boss,
  Under_sn_step.report AS report
FROM
  t_0_Under_sn_step AS Under_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Under_sn_full AS Under_sn_full
  WHERE
    (Under_sn_full.boss = Under_sn_step.boss) AND
    (Under_sn_full.report = Under_sn_step.report)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Under_sn_full SELECT * FROM logica_test.Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS SELECT
  Under_sn_new.boss AS boss,
  Under_sn_new.report AS report
FROM
  logica_test.Under_sn_new AS Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_new;
CREATE TABLE logica_test.Under_sn_new AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f7.boss AS boss,
  Under_MultBodyAggAux_f7.report AS report
FROM
  t_1_Under_MultBodyAggAux_f7 AS Under_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Under_sn_step.boss AS boss,
  Under_sn_step.report AS report
FROM
  t_0_Under_sn_step AS Under_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Under_sn_full AS Under_sn_full
  WHERE
    (Under_sn_full.boss = Under_sn_step.boss) AND
    (Under_sn_full.report = Under_sn_step.report)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Under_sn_full SELECT * FROM logica_test.Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS SELECT
  Under_sn_new.boss AS boss,
  Under_sn_new.report AS report
FROM
  logica_test.Under_sn_new AS Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_new;
CREATE TABLE logica_test.Under_sn_new AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f7.boss AS boss,
  Under_MultBodyAggAux_f7.report AS report
FROM
  t_1_Under_MultBodyAggAux_f7 AS Under_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Under_sn_step.boss AS boss,
  Under_sn_step.report AS report
FROM
  t_0_Under_sn_step AS Under_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Under_sn_full AS Under_sn_full
  WHERE
    (Under_sn_full.boss = Under_sn_step.boss) AND
    (Under_sn_full.report = Under_sn_step.report)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Under_sn_full SELECT * FROM logica_test.Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS SELECT
  Under_sn_new.boss AS boss,
  Under_sn_new.report AS report
FROM
  logica_test.Under_sn_new AS Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_new;
CREATE TABLE logica_test.Under_sn_new AS WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_2_Manages.boss AS boss,
      t_2_Manages.report AS report
    FROM
      t_2_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f7.boss AS boss,
  Under_MultBodyAggAux_f7.report AS report
FROM
  t_1_Under_MultBodyAggAux_f7 AS Under_MultBodyAggAux_f7
GROUP BY 1, 2)
SELECT
  Under_sn_step.boss AS boss,
  Under_sn_step.report AS report
FROM
  t_0_Under_sn_step AS Under_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Under_sn_full AS Under_sn_full
  WHERE
    (Under_sn_full.boss = Under_sn_step.boss) AND
    (Under_sn_full.report = Under_sn_step.report)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Under_sn_full SELECT * FROM logica_test.Under_sn_new;

DROP TABLE IF EXISTS logica_test.Under_sn_delta;
CREATE TABLE logica_test.Under_sn_delta AS SELECT
  Under_sn_new.boss AS boss,
  Under_sn_new.report AS report
FROM
  logica_test.Under_sn_new AS Under_sn_new;

SELECT
  Under_sn_full.boss AS boss
FROM
  logica_test.Under_sn_full AS Under_sn_full
WHERE
  ('acct' = Under_sn_full.report) ORDER BY boss;