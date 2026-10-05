SELECT
  JSON_EXTRACT(SPLIT('x;y;z', ';'), '$[' || 2 || ']') AS v;