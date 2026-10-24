-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS synalog_home.Even_ifr1;
CREATE TABLE synalog_home.Even_ifr1 AS WITH t_0_Even_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f4.n AS n
FROM
  t_0_Even_MultBodyAggAux_f4 AS Even_MultBodyAggAux_f4
GROUP BY Even_MultBodyAggAux_f4.n;

-- Interacting with table synalog_home.Even_ifr1

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr1.n) + (1)) AS n
FROM
  synalog_home.Even_ifr1 AS Even_ifr1
WHERE
  (Even_ifr1.n < 100)
GROUP BY ((Even_ifr1.n) + (1));

-- Interacting with table synalog_home.Odd_ifr2

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

-- Interacting with table synalog_home.Even_ifr3

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

-- Interacting with table synalog_home.Odd_ifr2

DROP TABLE IF EXISTS synalog_home.Even_ifr0;
CREATE TABLE synalog_home.Even_ifr0 AS WITH t_0_Even_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f1.n AS n
FROM
  t_0_Even_MultBodyAggAux_f1 AS Even_MultBodyAggAux_f1
GROUP BY Even_MultBodyAggAux_f1.n;

-- Interacting with table synalog_home.Even_ifr0

DROP TABLE IF EXISTS synalog_home.Odd_ifr1;
CREATE TABLE synalog_home.Odd_ifr1 AS SELECT
  ((Even_ifr0.n) + (1)) AS n
FROM
  synalog_home.Even_ifr0 AS Even_ifr0
WHERE
  (Even_ifr0.n < 100)
GROUP BY ((Even_ifr0.n) + (1));

-- Interacting with table synalog_home.Odd_ifr1

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr1.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr1 AS Odd_ifr1
    WHERE
      (Odd_ifr1.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f5.n AS n
FROM
  t_0_Even_MultBodyAggAux_f5 AS Even_MultBodyAggAux_f5
GROUP BY Even_MultBodyAggAux_f5.n;

-- Interacting with table synalog_home.Even_ifr2

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

-- Interacting with table synalog_home.Odd_ifr3

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

-- Interacting with table synalog_home.Even_ifr2

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr3;
CREATE TABLE synalog_home.Even_ifr3 AS WITH t_0_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr2.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr2
    WHERE
      (Odd_ifr2.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f8.n AS n
FROM
  t_0_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY Even_MultBodyAggAux_f8.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr3;
CREATE TABLE synalog_home.Odd_ifr3 AS SELECT
  ((Even_ifr2.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr2
WHERE
  (Even_ifr2.n < 100)
GROUP BY ((Even_ifr2.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even_ifr2;
CREATE TABLE synalog_home.Even_ifr2 AS WITH t_0_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr3.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr3 AS Odd_ifr3
    WHERE
      (Odd_ifr3.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_0_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY Even_MultBodyAggAux_f9.n;

DROP TABLE IF EXISTS synalog_home.Odd_ifr2;
CREATE TABLE synalog_home.Odd_ifr2 AS SELECT
  ((Even_ifr3.n) + (1)) AS n
FROM
  synalog_home.Even_ifr3 AS Even_ifr3
WHERE
  (Even_ifr3.n < 100)
GROUP BY ((Even_ifr3.n) + (1));

DROP TABLE IF EXISTS synalog_home.Even;
CREATE TABLE synalog_home.Even AS WITH t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_ifr4.n) + (1)) AS n
    FROM
      synalog_home.Odd_ifr2 AS Odd_ifr4
    WHERE
      (Odd_ifr4.n < 100)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.n AS n
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY Even_MultBodyAggAux_f12.n;

-- Interacting with table synalog_home.Even

DROP TABLE IF EXISTS synalog_home.Odd;
CREATE TABLE synalog_home.Odd AS SELECT
  ((Even_ifr4.n) + (1)) AS n
FROM
  synalog_home.Even_ifr2 AS Even_ifr4
WHERE
  (Even_ifr4.n < 100)
GROUP BY ((Even_ifr4.n) + (1));

-- Interacting with table synalog_home.Odd

WITH t_0_Test_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Even.n AS t
    FROM
      synalog_home.Even AS Even
   UNION ALL
  
    SELECT
      Odd.n AS t
    FROM
      synalog_home.Odd AS Odd
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Test_MultBodyAggAux.t) AS t
FROM
  t_0_Test_MultBodyAggAux AS Test_MultBodyAggAux;