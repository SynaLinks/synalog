SELECT
  CARDINALITY(SPLIT('aaa', 'aa')) AS n,
  ELEMENT_AT(SPLIT('aaa', 'aa'), 0 + 1) AS first,
  ELEMENT_AT(SPLIT('aaa', 'aa'), ((CARDINALITY(SPLIT('aaa', 'aa'))) - (1)) + 1) AS last;