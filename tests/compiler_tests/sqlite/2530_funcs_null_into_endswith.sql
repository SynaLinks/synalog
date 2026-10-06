SELECT
  (LENGTH(null) <= LENGTH('a') AND SUBSTR('a', LENGTH('a') - LENGTH(null) + 1, LENGTH(null)) = null) AS v;