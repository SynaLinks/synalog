SELECT
  CARDINALITY(SPLIT('a,b,c', ',')) AS n,
  ARRAY_JOIN(SPLIT('a,b,c', ','), ',') AS s;