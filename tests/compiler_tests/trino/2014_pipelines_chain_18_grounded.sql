DROP TABLE IF EXISTS synalog_test.C0;
CREATE TABLE synalog_test.C0 AS SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4, 5, 6, 7, 8], synalog_e -> ROW(synalog_e))) as pushkin(x_1);

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

DROP TABLE IF EXISTS synalog_test.C9;
CREATE TABLE synalog_test.C9 AS SELECT
  C6.x AS x
FROM
  synalog_test.C6 AS C6
WHERE
  (C6.x IS DISTINCT FROM 9) AND
  (C6.x IS DISTINCT FROM 8) AND
  (C6.x IS DISTINCT FROM 7);

-- Interacting with table synalog_test.C9

DROP TABLE IF EXISTS synalog_test.C12;
CREATE TABLE synalog_test.C12 AS SELECT
  C9.x AS x
FROM
  synalog_test.C9 AS C9
WHERE
  (C9.x IS DISTINCT FROM 12) AND
  (C9.x IS DISTINCT FROM 11) AND
  (C9.x IS DISTINCT FROM 10);

-- Interacting with table synalog_test.C12

DROP TABLE IF EXISTS synalog_test.C15;
CREATE TABLE synalog_test.C15 AS SELECT
  C12.x AS x
FROM
  synalog_test.C12 AS C12
WHERE
  (C12.x IS DISTINCT FROM 15) AND
  (C12.x IS DISTINCT FROM 14) AND
  (C12.x IS DISTINCT FROM 13);

-- Interacting with table synalog_test.C15

DROP TABLE IF EXISTS synalog_test.C18;
CREATE TABLE synalog_test.C18 AS SELECT
  C15.x AS x
FROM
  synalog_test.C15 AS C15
WHERE
  (C15.x IS DISTINCT FROM 18) AND
  (C15.x IS DISTINCT FROM 17) AND
  (C15.x IS DISTINCT FROM 16);

-- Interacting with table synalog_test.C18

SELECT
  C18.x AS x
FROM
  synalog_test.C18 AS C18;