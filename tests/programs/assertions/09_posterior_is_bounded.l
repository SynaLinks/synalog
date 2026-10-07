# Every posterior is a probability.
# Expect: holds Posterior.bounded

@Assert(Posterior, bounded: "∀ h e, 0 ≤ Posterior h e ∧ Posterior h e ≤ 1");
Prior(h: "sick", p: 0.01);
Prior(h: "healthy", p: 0.99);
Likelihood(h: "sick", e: "positive", p: 0.95);
Likelihood(h: "sick", e: "negative", p: 0.05);
Likelihood(h: "healthy", e: "positive", p: 0.05);
Likelihood(h: "healthy", e: "negative", p: 0.95);
Joint(h:, e:, p:) :- Prior(h:, p: prior), Likelihood(h:, e:, p: lik), p == prior * lik;
Evidence(e:, p? += joint) distinct :- Joint(e:, p: joint);
Posterior(h:, e:, p:) :- Joint(h:, e:, p: joint), Evidence(e:, p: total), p == joint / total;
