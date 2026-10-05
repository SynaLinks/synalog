SELECT
  ARRAY_TO_STRING(SPLIT("x.y.z", "."), ".") AS s;