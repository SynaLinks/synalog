DROP TABLE IF EXISTS synalog_test.C0;
CREATE TABLE synalog_test.C0 AS SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]) as x_1;

-- Interacting with table synalog_test.C0

DROP TABLE IF EXISTS synalog_test.C3;
CREATE TABLE synalog_test.C3 AS SELECT
  C0.x AS x
FROM
  synalog_test.C0 AS C0
WHERE
  (C0.x IS DISTINCT FROM 3) AND
  (C0.x IS DISTINCT FROM 2) AND
  (C0.x IS DISTINCT FROM 1);

-- Interacting with table synalog_test.C3

DROP TABLE IF EXISTS synalog_test.C6;
CREATE TABLE synalog_test.C6 AS SELECT
  C3.x AS x
FROM
  synalog_test.C3 AS C3
WHERE
  (C3.x IS DISTINCT FROM 6) AND
  (C3.x IS DISTINCT FROM 5) AND
  (C3.x IS DISTINCT FROM 4);

-- Interacting with table synalog_test.C6

SELECT
  C6.x AS x
FROM
  synalog_test.C6 AS C6 ORDER BY x NULLS LAST;