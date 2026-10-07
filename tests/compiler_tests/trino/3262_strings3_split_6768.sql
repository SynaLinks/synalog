SELECT
  CARDINALITY(SPLIT('one--two', '--')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('one--two', '--'), 0 + 1) END) AS first,
  (CASE WHEN ((CARDINALITY(SPLIT('one--two', '--'))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('one--two', '--'), ((CARDINALITY(SPLIT('one--two', '--'))) - (1)) + 1) END) AS last;