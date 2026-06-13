# Test: ArgMaxK / ArgMinK top-k aggregation

Score(team: "A", player: "p1", points: 10);
Score(team: "A", player: "p2", points: 30);
Score(team: "A", player: "p3", points: 20);
Score(team: "B", player: "p4", points: 50);
Score(team: "B", player: "p5", points: 40);

# Aggregating aliases: top 2 players per team by points, and the bottom 1
TopTwo(x) = ArgMaxK(x, 2);
BottomOne(x) = ArgMinK(x, 1);

@OrderBy(TeamLeaders, "team");
TeamLeaders(team:,
            top2? TopTwo= player -> points,
            bottom1? BottomOne= player -> points) distinct :-
  Score(team:, player:, points:);

@OrderBy(Test, "team");
Test(team:, top2:, bottom1:) :- TeamLeaders(team:, top2:, bottom1:);
