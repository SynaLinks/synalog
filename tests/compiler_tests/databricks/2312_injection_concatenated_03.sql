SELECT
  (CONCAT((CONCAT("[", "') UNION SELECT 1 --")), "]")) AS s;