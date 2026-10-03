DROP TABLE IF EXISTS logica_test.A_ifr0;
CREATE TABLE logica_test.A_ifr0 AS WITH t_0_A_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f1.y AS y
FROM
  t_0_A_MultBodyAggAux_f1 AS A_MultBodyAggAux_f1
GROUP BY y;

-- Interacting with table logica_test.A_ifr0

DROP TABLE IF EXISTS logica_test.A_ifr1;
CREATE TABLE logica_test.A_ifr1 AS WITH t_0_A_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr0 AS A_ifr0, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr0.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f2.y AS y
FROM
  t_0_A_MultBodyAggAux_f2 AS A_MultBodyAggAux_f2
GROUP BY y;

-- Interacting with table logica_test.A_ifr1

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr1 AS A_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f3.y AS y
FROM
  t_0_A_MultBodyAggAux_f3 AS A_MultBodyAggAux_f3
GROUP BY y;

-- Interacting with table logica_test.A_ifr2

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

-- Interacting with table logica_test.A_ifr3

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

-- Interacting with table logica_test.A_ifr2

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr3;
CREATE TABLE logica_test.A_ifr3 AS WITH t_0_A_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f4.y AS y
FROM
  t_0_A_MultBodyAggAux_f4 AS A_MultBodyAggAux_f4
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A_ifr2;
CREATE TABLE logica_test.A_ifr2 AS WITH t_0_A_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr3 AS A_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f5.y AS y
FROM
  t_0_A_MultBodyAggAux_f5 AS A_MultBodyAggAux_f5
GROUP BY y;

DROP TABLE IF EXISTS logica_test.A;
CREATE TABLE logica_test.A AS WITH t_0_A_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.A_ifr2 AS A_ifr4, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (A_ifr4.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A_MultBodyAggAux_f6.y AS y
FROM
  t_0_A_MultBodyAggAux_f6 AS A_MultBodyAggAux_f6
GROUP BY y;

-- Interacting with table logica_test.A

DROP TABLE IF EXISTS logica_test.B_ifr0;
CREATE TABLE logica_test.B_ifr0 AS WITH t_0_B_MultBodyAggAux_f7 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f7.y AS y
FROM
  t_0_B_MultBodyAggAux_f7 AS B_MultBodyAggAux_f7
GROUP BY y;

-- Interacting with table logica_test.B_ifr0

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr0 AS B_ifr0, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr0.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f8.y AS y
FROM
  t_0_B_MultBodyAggAux_f8 AS B_MultBodyAggAux_f8
GROUP BY y;

-- Interacting with table logica_test.B_ifr1

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

-- Interacting with table logica_test.B_ifr2

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

-- Interacting with table logica_test.B_ifr1

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr2;
CREATE TABLE logica_test.B_ifr2 AS WITH t_0_B_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr1, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr1.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f9.y AS y
FROM
  t_0_B_MultBodyAggAux_f9 AS B_MultBodyAggAux_f9
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B_ifr1;
CREATE TABLE logica_test.B_ifr1 AS WITH t_0_B_MultBodyAggAux_f10 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr2 AS B_ifr2, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr2.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f10.y AS y
FROM
  t_0_B_MultBodyAggAux_f10 AS B_MultBodyAggAux_f10
GROUP BY y;

DROP TABLE IF EXISTS logica_test.B;
CREATE TABLE logica_test.B AS WITH t_0_B_MultBodyAggAux_f11 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      logica_test.B_ifr1 AS B_ifr3, UNNEST(GENERATE_ARRAY(0, 100 - 1)) as x_7
    WHERE
      (B_ifr3.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B_MultBodyAggAux_f11.y AS y
FROM
  t_0_B_MultBodyAggAux_f11 AS B_MultBodyAggAux_f11
GROUP BY y;

-- Interacting with table logica_test.B

SELECT
  MAX(A.y) AS a,
  MAX(B.y) AS b
FROM
  logica_test.A AS A, logica_test.B AS B;