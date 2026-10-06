SELECT
  (CASE WHEN LENGTH('a') >= null THEN SUBSTR('a', 1, null) ELSE 'a' || SUBSTR(REPLACE(HEX(ZEROBLOB(null)), '00', 'x'), 1, null - LENGTH('a')) END) AS v;