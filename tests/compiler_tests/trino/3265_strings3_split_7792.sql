SELECT
  CARDINALITY(SPLIT('a::b::c', '::')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('a::b::c', '::'), 0 + 1) END) AS first,
  (CASE WHEN ((CARDINALITY(SPLIT('a::b::c', '::'))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('a::b::c', '::'), ((CARDINALITY(SPLIT('a::b::c', '::'))) - (1)) + 1) END) AS last;