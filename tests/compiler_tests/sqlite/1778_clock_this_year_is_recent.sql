SELECT
  SUM(1) AS n
FROM
  (SELECT date('now') AS date) AS Today
WHERE
  (CAST(SUBSTR(Today.date, 1, 4) AS INTEGER) > 2025);
