SELECT
  (CONCAT((CONCAT("[", "');ATTACH DATABASE 'x' AS y;--")), "]")) AS s;