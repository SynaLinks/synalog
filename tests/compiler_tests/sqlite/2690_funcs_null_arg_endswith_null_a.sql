SELECT
  (LENGTH('a') <= LENGTH(null) AND SUBSTR(null, LENGTH(null) - LENGTH('a') + 1, LENGTH('a')) = 'a') AS v;