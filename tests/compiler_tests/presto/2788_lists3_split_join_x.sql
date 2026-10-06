SELECT
  CARDINALITY(SPLIT('x', ',')) AS n,
  ARRAY_JOIN(SPLIT('x', ','), ',') AS s;