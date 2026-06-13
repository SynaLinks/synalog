# Test: ArgMin and ArgMax
@Engine("duckdb");

Score(player: "Alice", points: 85);
Score(player: "Bob", points: 92);
Score(player: "Charlie", points: 78);

# ArgMax - find player with highest score
BestPlayer() ArgMax= player -> points :- Score(player:, points:);

# ArgMin - find player with lowest score
WorstPlayer() ArgMin= player -> points :- Score(player:, points:);

Test(best: BestPlayer(), worst: WorstPlayer());
