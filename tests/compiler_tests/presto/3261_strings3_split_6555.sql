SELECT
  CARDINALITY(SPLIT('a$b', '$')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('a$b', '$'), 0 + 1) END) AS first,
  (CASE WHEN ((CARDINALITY(SPLIT('a$b', '$'))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('a$b', '$'), ((CARDINALITY(SPLIT('a$b', '$'))) - (1)) + 1) END) AS last;