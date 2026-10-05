DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS `from`,
      2 AS `to`
   UNION ALL
  
    SELECT
      2 AS `from`,
      3 AS `to`
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Edge.`to` AS `to`
    FROM
      t_1_Edge AS Edge
    WHERE
      (Edge.`from` = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.`to` AS `to`
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table logica_test.Reach_sn_delta

DROP TABLE IF EXISTS logica_test.Reach_sn_full;
CREATE TABLE logica_test.Reach_sn_full AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS `from`,
      2 AS `to`
   UNION ALL
  
    SELECT
      2 AS `from`,
      3 AS `to`
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.`to` AS `to`
    FROM
      t_1_Edge AS Edge
    WHERE
      (Edge.`from` = 1)
   UNION ALL
  
    SELECT
      t_3_Edge.`to` AS `to`
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.`from` = t_2_Reach_sn_delta.`to`)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT * FROM (
  
    SELECT
      Reach_sn_delta.`to` AS `to`
    FROM
      logica_test.Reach_sn_delta AS Reach_sn_delta
   UNION ALL
  
    SELECT
      Reach_sn_step.`to` AS `to`
    FROM
      t_0_Reach_sn_step AS Reach_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Reach_sn_full

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS `from`,
      2 AS `to`
   UNION ALL
  
    SELECT
      2 AS `from`,
      3 AS `to`
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.`to` AS `to`
    FROM
      t_1_Edge AS Edge
    WHERE
      (Edge.`from` = 1)
   UNION ALL
  
    SELECT
      t_3_Edge.`to` AS `to`
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.`from` = t_2_Reach_sn_delta.`to`)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS `from`,
      2 AS `to`
   UNION ALL
  
    SELECT
      2 AS `from`,
      3 AS `to`
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.`to` AS `to`
    FROM
      t_1_Edge AS Edge
    WHERE
      (Edge.`from` = 1)
   UNION ALL
  
    SELECT
      t_3_Edge.`to` AS `to`
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.`from` = t_2_Reach_sn_delta.`to`)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS `from`,
      2 AS `to`
   UNION ALL
  
    SELECT
      2 AS `from`,
      3 AS `to`
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.`to` AS `to`
    FROM
      t_1_Edge AS Edge
    WHERE
      (Edge.`from` = 1)
   UNION ALL
  
    SELECT
      t_3_Edge.`to` AS `to`
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.`from` = t_2_Reach_sn_delta.`to`)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS `from`,
      2 AS `to`
   UNION ALL
  
    SELECT
      2 AS `from`,
      3 AS `to`
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.`to` AS `to`
    FROM
      t_1_Edge AS Edge
    WHERE
      (Edge.`from` = 1)
   UNION ALL
  
    SELECT
      t_3_Edge.`to` AS `to`
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.`from` = t_2_Reach_sn_delta.`to`)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_new;
CREATE TABLE logica_test.Reach_sn_new AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS `from`,
      2 AS `to`
   UNION ALL
  
    SELECT
      2 AS `from`,
      3 AS `to`
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Edge.`to` AS `to`
    FROM
      t_1_Edge AS Edge
    WHERE
      (Edge.`from` = 1)
   UNION ALL
  
    SELECT
      t_3_Edge.`to` AS `to`
    FROM
      logica_test.Reach_sn_delta AS t_2_Reach_sn_delta, t_1_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.`from` = t_2_Reach_sn_delta.`to`)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_sn_step AS (SELECT
  Reach_MultBodyAggAux_f2.`to` AS `to`
FROM
  t_1_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY 1)
SELECT
  Reach_sn_step.`to` AS `to`
FROM
  t_0_Reach_sn_step AS Reach_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Reach_sn_full AS Reach_sn_full
  WHERE
    (Reach_sn_full.`to` = Reach_sn_step.`to`)) IS NULL)
GROUP BY 1;

INSERT INTO logica_test.Reach_sn_full SELECT * FROM logica_test.Reach_sn_new;

DROP TABLE IF EXISTS logica_test.Reach_sn_delta;
CREATE TABLE logica_test.Reach_sn_delta AS SELECT
  Reach_sn_new.`to` AS `to`
FROM
  logica_test.Reach_sn_new AS Reach_sn_new;

SELECT
  Reach_sn_full.`to` AS `to`
FROM
  logica_test.Reach_sn_full AS Reach_sn_full ORDER BY `to` NULLS LAST;