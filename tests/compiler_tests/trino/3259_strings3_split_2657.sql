SELECT
  CARDINALITY(SPLIT('x||y||', '||')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('x||y||', '||'), 0 + 1) END) AS first,
  (CASE WHEN ((CARDINALITY(SPLIT('x||y||', '||'))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('x||y||', '||'), ((CARDINALITY(SPLIT('x||y||', '||'))) - (1)) + 1) END) AS last;