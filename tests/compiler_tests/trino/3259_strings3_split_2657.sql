SELECT
  CARDINALITY(SPLIT('x||y||', '||')) AS n,
  ELEMENT_AT(SPLIT('x||y||', '||'), 0 + 1) AS first,
  ELEMENT_AT(SPLIT('x||y||', '||'), ((CARDINALITY(SPLIT('x||y||', '||'))) - (1)) + 1) AS last;