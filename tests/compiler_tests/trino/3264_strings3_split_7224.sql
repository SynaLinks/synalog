SELECT
  CARDINALITY(SPLIT('aaa', 'aa')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('aaa', 'aa'), 0 + 1) END) AS first,
  (CASE WHEN ((CARDINALITY(SPLIT('aaa', 'aa'))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('aaa', 'aa'), ((CARDINALITY(SPLIT('aaa', 'aa'))) - (1)) + 1) END) AS last;