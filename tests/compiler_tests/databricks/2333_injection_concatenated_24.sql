SELECT
  (CONCAT((CONCAT("[", "'+(SELECT 1)+'")), "]")) AS s;