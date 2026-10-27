ATTACH DATABASE ':memory:' AS synalog_test;

DROP TABLE IF EXISTS synalog_test.C0;
CREATE TABLE synalog_test.C0 AS SELECT
  x_1.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_1;

-- Interacting with table synalog_test.C0

DROP TABLE IF EXISTS synalog_test.C3;
CREATE TABLE synalog_test.C3 AS SELECT
  C0.x AS x
FROM
  synalog_test.C0 AS C0
WHERE
  (C0.x IS NOT 3) AND
  (C0.x IS NOT 2) AND
  (C0.x IS NOT 1);

-- Interacting with table synalog_test.C3

DROP TABLE IF EXISTS synalog_test.C6;
CREATE TABLE synalog_test.C6 AS SELECT
  C3.x AS x
FROM
  synalog_test.C3 AS C3
WHERE
  (C3.x IS NOT 6) AND
  (C3.x IS NOT 5) AND
  (C3.x IS NOT 4);

-- Interacting with table synalog_test.C6

DROP TABLE IF EXISTS synalog_test.C9;
CREATE TABLE synalog_test.C9 AS SELECT
  C6.x AS x
FROM
  synalog_test.C6 AS C6
WHERE
  (C6.x IS NOT 9) AND
  (C6.x IS NOT 8) AND
  (C6.x IS NOT 7);

-- Interacting with table synalog_test.C9

DROP TABLE IF EXISTS synalog_test.C12;
CREATE TABLE synalog_test.C12 AS SELECT
  C9.x AS x
FROM
  synalog_test.C9 AS C9
WHERE
  (C9.x IS NOT 12) AND
  (C9.x IS NOT 11) AND
  (C9.x IS NOT 10);

-- Interacting with table synalog_test.C12

DROP TABLE IF EXISTS synalog_test.C15;
CREATE TABLE synalog_test.C15 AS SELECT
  C12.x AS x
FROM
  synalog_test.C12 AS C12
WHERE
  (C12.x IS NOT 15) AND
  (C12.x IS NOT 14) AND
  (C12.x IS NOT 13);

-- Interacting with table synalog_test.C15

DROP TABLE IF EXISTS synalog_test.C18;
CREATE TABLE synalog_test.C18 AS SELECT
  C15.x AS x
FROM
  synalog_test.C15 AS C15
WHERE
  (C15.x IS NOT 18) AND
  (C15.x IS NOT 17) AND
  (C15.x IS NOT 16);

-- Interacting with table synalog_test.C18

SELECT
  C18.x AS x
FROM
  synalog_test.C18 AS C18;