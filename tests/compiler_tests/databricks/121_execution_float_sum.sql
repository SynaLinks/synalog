SELECT
  SUM(x_2) AS t
FROM
  explode(ARRAY(0.1E0, 0.2E0, 0.3E0)) AS pushkin(x_2);