SELECT
  ELEMENT_AT(SPLIT('a,b,c', ','), ((CARDINALITY(SPLIT('a,b,c', ','))) - (1)) + 1) AS s;
