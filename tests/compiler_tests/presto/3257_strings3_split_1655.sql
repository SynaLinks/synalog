SELECT
  CARDINALITY(SPLIT('a.b.c', '.')) AS n,
  ELEMENT_AT(SPLIT('a.b.c', '.'), 0 + 1) AS first,
  ELEMENT_AT(SPLIT('a.b.c', '.'), ((CARDINALITY(SPLIT('a.b.c', '.'))) - (1)) + 1) AS last;