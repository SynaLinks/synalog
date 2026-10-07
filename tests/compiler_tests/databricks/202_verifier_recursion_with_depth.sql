DROP TABLE IF EXISTS logica_test.Path_ifr0;
CREATE TABLE logica_test.Path_ifr0 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Path_ifr0

DROP TABLE IF EXISTS logica_test.Path_ifr1;
CREATE TABLE logica_test.Path_ifr1 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr0.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr0 AS Path_ifr0
    WHERE
      (Path_ifr0.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Path_ifr1

DROP TABLE IF EXISTS logica_test.Path_ifr2;
CREATE TABLE logica_test.Path_ifr2 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr1.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr1 AS Path_ifr1
    WHERE
      (Path_ifr1.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Path_ifr2

DROP TABLE IF EXISTS logica_test.Path_ifr1;
CREATE TABLE logica_test.Path_ifr1 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr2.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr2 AS Path_ifr2
    WHERE
      (Path_ifr2.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

-- Interacting with table logica_test.Path_ifr1

DROP TABLE IF EXISTS logica_test.Path_ifr2;
CREATE TABLE logica_test.Path_ifr2 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr1.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr1 AS Path_ifr1
    WHERE
      (Path_ifr1.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Path_ifr1;
CREATE TABLE logica_test.Path_ifr1 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr2.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr2 AS Path_ifr2
    WHERE
      (Path_ifr2.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Path_ifr2;
CREATE TABLE logica_test.Path_ifr2 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr1.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr1 AS Path_ifr1
    WHERE
      (Path_ifr1.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Path_ifr1;
CREATE TABLE logica_test.Path_ifr1 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr2.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr2 AS Path_ifr2
    WHERE
      (Path_ifr2.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Path_ifr2;
CREATE TABLE logica_test.Path_ifr2 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr1.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr1 AS Path_ifr1
    WHERE
      (Path_ifr1.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

DROP TABLE IF EXISTS logica_test.Path_ifr1;
CREATE TABLE logica_test.Path_ifr1 AS SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr2.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr2 AS Path_ifr2
    WHERE
      (Path_ifr2.b = 1)
  
) AS UNUSED_TABLE_NAME  ;

SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      Path_ifr3.a AS a,
      2 AS b
    FROM
      logica_test.Path_ifr1 AS Path_ifr3
    WHERE
      (Path_ifr3.b = 1)
  
) AS UNUSED_TABLE_NAME  ;