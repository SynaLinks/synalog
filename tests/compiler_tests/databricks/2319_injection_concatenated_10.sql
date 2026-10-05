SELECT
  (CONCAT((CONCAT("[", "'; COMMIT; DROP TABLE t; --")), "]")) AS s;