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

DROP TABLE IF EXISTS logica_test.Under_sn_full;
CREATE TABLE logica_test.Under_sn_full AS WITH t_2_Manages AS (SELECT * FROM (
  
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
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Under_sn_delta.boss AS boss,
      Under_sn_delta.report AS report
    FROM
      logica_test.Under_sn_delta AS Under_sn_delta
   UNION ALL
  
    SELECT
      Under_sn_step.boss AS boss,
      Under_sn_step.report AS report
    FROM
      t_0_Under_sn_step AS Under_sn_step
    WHERE
      (1 = 0)
  
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
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
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
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
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
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
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
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
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
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
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
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
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
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
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
t_1_Under_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      t_2_Under_sn_delta.boss AS boss,
      Manages.report AS report
    FROM
      logica_test.Under_sn_delta AS t_2_Under_sn_delta, t_2_Manages AS Manages
    WHERE
      (Manages.boss = t_2_Under_sn_delta.report)
   UNION ALL
  
    SELECT
      t_3_Manages.boss AS boss,
      t_3_Manages.report AS report
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Under_sn_step AS (SELECT
  Under_MultBodyAggAux_f2.boss AS boss,
  Under_MultBodyAggAux_f2.report AS report
FROM
  t_1_Under_MultBodyAggAux_f2 AS Under_MultBodyAggAux_f2
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

DROP TABLE IF EXISTS logica_test.Under;
CREATE TABLE logica_test.Under AS SELECT
  Under_sn_full.boss AS boss,
  Under_sn_full.report AS report
FROM
  logica_test.Under_sn_full AS Under_sn_full;

-- Interacting with table logica_test.Under

SELECT
  Under.boss AS boss
FROM
  logica_test.Under AS Under, logica_test.Under AS t_0_Under
WHERE
  (Under.report = 'dev2') AND
  (t_0_Under.boss = Under.boss) AND
  (t_0_Under.report = 'acct');
