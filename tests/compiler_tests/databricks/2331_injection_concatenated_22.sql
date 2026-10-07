SELECT
  (CONCAT((CONCAT("[", "’; DROP TABLE t; --")), "]")) AS s;