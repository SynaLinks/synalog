SELECT
  (CASE WHEN ((CARDINALITY(SPLIT('a,b,c', ','))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT('a,b,c', ','), ((CARDINALITY(SPLIT('a,b,c', ','))) - (1)) + 1) END) AS s;