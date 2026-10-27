DROP TABLE IF EXISTS synalog_test.C0;
CREATE TABLE synalog_test.C0 AS SELECT
  x_1 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) AS x_1) AS pushkin;

-- Interacting with table synalog_test.C0

DROP TABLE IF EXISTS synalog_test.C3;
CREATE TABLE synalog_test.C3 AS SELECT
  C0.x AS x
FROM
  synalog_test.C0 AS C0
WHERE
  (NOT (C0.x <=> 3)) AND
  (NOT (C0.x <=> 2)) AND
  (NOT (C0.x <=> 1));

-- Interacting with table synalog_test.C3

DROP TABLE IF EXISTS synalog_test.C6;
CREATE TABLE synalog_test.C6 AS SELECT
  C3.x AS x
FROM
  synalog_test.C3 AS C3
WHERE
  (NOT (C3.x <=> 6)) AND
  (NOT (C3.x <=> 5)) AND
  (NOT (C3.x <=> 4));

-- Interacting with table synalog_test.C6

SELECT
  C6.x AS x
FROM
  synalog_test.C6 AS C6 ORDER BY x NULLS LAST;
