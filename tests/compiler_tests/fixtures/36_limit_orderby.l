# Test: @Limit with @OrderBy combinations

# Data
Scores("Alice", 95);
Scores("Bob", 87);
Scores("Charlie", 92);
Scores("Diana", 88);
Scores("Eve", 91);
Scores("Frank", 85);
Scores("Grace", 93);
Scores("Henry", 89);

# Top 3 by score descending
@OrderBy(Top3, "score desc");
@Limit(Top3, 3);
Top3(name, score) :- Scores(name, score);

# Bottom 3 by score ascending
@OrderBy(Bottom3, "score");
@Limit(Bottom3, 3);
Bottom3(name, score) :- Scores(name, score);

# Top 5 alphabetically
@OrderBy(First5Alpha, "name");
@Limit(First5Alpha, 5);
First5Alpha(name, score) :- Scores(name, score);

# Combined: Top scorer per first letter (using ArgMax)
ByLetter(letter, top_name? ArgMax= name -> score, top_score? Max= score) distinct :-
  Scores(name, score),
  letter == Substr(name, 1, 1);

@OrderBy(Test, "score desc");
@Limit(Test, 3);
Test(name:, score:) :- Scores(name, score);
