# The parts of event 9's time, as numbers.
# Expect: rows Q = [(2026, 3, 31, 9, 0)]
Event(id: 1, at: "2025-12-30 23:15:00", kind: "login", user: "ana");
Event(id: 2, at: "2026-01-02 08:05:30", kind: "buy", user: "ana");
Event(id: 3, at: "2026-01-15 12:00:00", kind: "login", user: "ben");
Event(id: 4, at: "2026-02-01 00:00:01", kind: "buy", user: "ben");
Event(id: 5, at: "2026-02-14 18:45:10", kind: "buy", user: "ana");
Event(id: 6, at: "2026-02-28 23:59:59", kind: "login", user: "cy");
Event(id: 7, at: "2026-03-01 06:30:00", kind: "buy", user: "cy");
Event(id: 8, at: "2026-03-15 14:20:00", kind: "refund", user: "ana");
Event(id: 9, at: "2026-03-31 09:00:00", kind: "login", user: "ben");
Event(id: 10, at: "2026-04-01 10:10:10", kind: "buy", user: "ben");
Q(y: ToInt64(Substr(at, 1, 4)), m: ToInt64(Substr(at, 6, 2)), d: ToInt64(Substr(at, 9, 2)),
  h: ToInt64(Substr(at, 12, 2)), mi: ToInt64(Substr(at, 15, 2))) :- Event(id: 9, at:);
