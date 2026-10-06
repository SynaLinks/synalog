SELECT
  CARDINALITY(SPLIT('one--two', '--')) AS n,
  ELEMENT_AT(SPLIT('one--two', '--'), 0 + 1) AS first,
  ELEMENT_AT(SPLIT('one--two', '--'), ((CARDINALITY(SPLIT('one--two', '--'))) - (1)) + 1) AS last;