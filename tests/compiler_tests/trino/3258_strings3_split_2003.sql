SELECT
  CARDINALITY(SPLIT('a^b', '^')) AS n,
  ELEMENT_AT(SPLIT('a^b', '^'), 0 + 1) AS first,
  ELEMENT_AT(SPLIT('a^b', '^'), ((CARDINALITY(SPLIT('a^b', '^'))) - (1)) + 1) AS last;