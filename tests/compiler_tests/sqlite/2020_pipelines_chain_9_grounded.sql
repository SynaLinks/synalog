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

SELECT
  C9.x AS x
FROM
  synalog_test.C9 AS C9;