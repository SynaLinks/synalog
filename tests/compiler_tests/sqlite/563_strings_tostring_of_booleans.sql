SELECT
  (CASE true WHEN 1 THEN 'true' WHEN 0 THEN 'false' END) AS a,
  (CASE false WHEN 1 THEN 'true' WHEN 0 THEN 'false' END) AS b;