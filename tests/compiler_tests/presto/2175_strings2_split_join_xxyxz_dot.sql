SELECT
  ARRAY_JOIN(SPLIT('x.y.z', '.'), '.') AS s;
