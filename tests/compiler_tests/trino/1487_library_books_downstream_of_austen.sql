DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS WITH t_1_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Down_MultBodyAggAux_f1.a AS a,
  Down_MultBodyAggAux_f1.b AS b
FROM
  t_0_Down_MultBodyAggAux_f1 AS Down_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table logica_test.Down_sn_delta

DROP TABLE IF EXISTS logica_test.Down_sn_full;
CREATE TABLE logica_test.Down_sn_full AS WITH t_1_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      t_2_Down_sn_delta.a AS a,
      t_3_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_1_Influenced AS t_3_Influenced
    WHERE
      (t_3_Influenced.a = t_2_Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.a AS a,
  Down_MultBodyAggAux_f2.b AS b
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT * FROM (
  
    SELECT
      Down_sn_delta.a AS a,
      Down_sn_delta.b AS b
    FROM
      logica_test.Down_sn_delta AS Down_sn_delta
   UNION ALL
  
    SELECT
      Down_sn_step.a AS a,
      Down_sn_step.b AS b
    FROM
      t_0_Down_sn_step AS Down_sn_step
    WHERE
      (1 = 0)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Down_sn_full

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      t_2_Down_sn_delta.a AS a,
      t_3_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_1_Influenced AS t_3_Influenced
    WHERE
      (t_3_Influenced.a = t_2_Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.a AS a,
  Down_MultBodyAggAux_f2.b AS b
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS SELECT
  Down_sn_new.a AS a,
  Down_sn_new.b AS b
FROM
  logica_test.Down_sn_new AS Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      t_2_Down_sn_delta.a AS a,
      t_3_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_1_Influenced AS t_3_Influenced
    WHERE
      (t_3_Influenced.a = t_2_Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.a AS a,
  Down_MultBodyAggAux_f2.b AS b
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS SELECT
  Down_sn_new.a AS a,
  Down_sn_new.b AS b
FROM
  logica_test.Down_sn_new AS Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      t_2_Down_sn_delta.a AS a,
      t_3_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_1_Influenced AS t_3_Influenced
    WHERE
      (t_3_Influenced.a = t_2_Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.a AS a,
  Down_MultBodyAggAux_f2.b AS b
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS SELECT
  Down_sn_new.a AS a,
  Down_sn_new.b AS b
FROM
  logica_test.Down_sn_new AS Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      t_2_Down_sn_delta.a AS a,
      t_3_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_1_Influenced AS t_3_Influenced
    WHERE
      (t_3_Influenced.a = t_2_Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.a AS a,
  Down_MultBodyAggAux_f2.b AS b
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS SELECT
  Down_sn_new.a AS a,
  Down_sn_new.b AS b
FROM
  logica_test.Down_sn_new AS Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      t_2_Down_sn_delta.a AS a,
      t_3_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_1_Influenced AS t_3_Influenced
    WHERE
      (t_3_Influenced.a = t_2_Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.a AS a,
  Down_MultBodyAggAux_f2.b AS b
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS SELECT
  Down_sn_new.a AS a,
  Down_sn_new.b AS b
FROM
  logica_test.Down_sn_new AS Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_new;
CREATE TABLE logica_test.Down_sn_new AS WITH t_1_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_1_Influenced AS Influenced
   UNION ALL
  
    SELECT
      t_2_Down_sn_delta.a AS a,
      t_3_Influenced.b AS b
    FROM
      logica_test.Down_sn_delta AS t_2_Down_sn_delta, t_1_Influenced AS t_3_Influenced
    WHERE
      (t_3_Influenced.a = t_2_Down_sn_delta.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down_sn_step AS (SELECT
  Down_MultBodyAggAux_f2.a AS a,
  Down_MultBodyAggAux_f2.b AS b
FROM
  t_1_Down_MultBodyAggAux_f2 AS Down_MultBodyAggAux_f2
GROUP BY 1, 2)
SELECT
  Down_sn_step.a AS a,
  Down_sn_step.b AS b
FROM
  t_0_Down_sn_step AS Down_sn_step
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    logica_test.Down_sn_full AS Down_sn_full
  WHERE
    (Down_sn_full.a = Down_sn_step.a) AND
    (Down_sn_full.b = Down_sn_step.b)) IS NULL)
GROUP BY 1, 2;

INSERT INTO logica_test.Down_sn_full SELECT * FROM logica_test.Down_sn_new;

DROP TABLE IF EXISTS logica_test.Down_sn_delta;
CREATE TABLE logica_test.Down_sn_delta AS SELECT
  Down_sn_new.a AS a,
  Down_sn_new.b AS b
FROM
  logica_test.Down_sn_new AS Down_sn_new;

WITH t_0_Book AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'The Hobbit' AS title,
      'tolkien' AS author,
      1937 AS year
   UNION ALL
  
    SELECT
      2 AS id,
      'The Fellowship' AS title,
      'tolkien' AS author,
      1954 AS year
   UNION ALL
  
    SELECT
      3 AS id,
      'The Two Towers' AS title,
      'tolkien' AS author,
      1954 AS year
   UNION ALL
  
    SELECT
      4 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year
   UNION ALL
  
    SELECT
      5 AS id,
      'Dune Messiah' AS title,
      'herbert' AS author,
      1969 AS year
   UNION ALL
  
    SELECT
      6 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year
   UNION ALL
  
    SELECT
      7 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year
   UNION ALL
  
    SELECT
      8 AS id,
      'Neuromancer' AS title,
      'gibson' AS author,
      1984 AS year
   UNION ALL
  
    SELECT
      9 AS id,
      'Count Zero' AS title,
      'gibson' AS author,
      1986 AS year
   UNION ALL
  
    SELECT
      10 AS id,
      'Foundation' AS title,
      'asimov' AS author,
      1951 AS year
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Book.title AS title
FROM
  logica_test.Down_sn_full AS Down_sn_full, t_0_Book AS Book
WHERE
  ('austen' = Down_sn_full.a) AND
  (Book.author = Down_sn_full.b) ORDER BY title;
