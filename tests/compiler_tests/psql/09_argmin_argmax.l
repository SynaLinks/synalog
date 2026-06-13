# Test: Aggregations with ordering (simplified)

Score(player: "Alice", points: 85);
Score(player: "Bob", points: 92);
Score(player: "Charlie", points: 78);

# Find max and min scores using basic aggregations
MaxScore() Max= points :- Score(player:, points:);
MinScore() Min= points :- Score(player:, points:);

# Count players
PlayerCount() += 1 :- Score(player:, points:);

Test(max_score: MaxScore(), min_score: MinScore(), count: PlayerCount());
