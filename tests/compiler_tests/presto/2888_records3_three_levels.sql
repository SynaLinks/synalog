SELECT
  CAST(ROW(CAST(ROW(7) AS ROW(c double))) AS ROW(b ROW(c double))).b.c AS v;