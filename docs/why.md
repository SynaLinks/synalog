# Why Synalog

This page is the non-technical one. It explains the problem Synalog exists to solve, what changes when you adopt it, what it costs, and when something else is the better tool. Everything else in this documentation is the *how*.

## The problem: agents are fluent about data they don't understand

Every company now wants the same thing: let people ask questions in plain language and get answers from the company's own data. The obvious way to build it is to hand a language model the database schema and let it write SQL.

That works in a demo and erodes in production, for reasons that have nothing to do with model quality:

- **A schema is not a meaning.** A column called `status` has five possible values and a story behind each one. `revenue` exists in three tables and only one of them is the number finance uses. The model sees the names, not the story, so it guesses.
- **Every question starts from zero.** The definition of "active customer" that the agent painstakingly reconstructed on Monday is gone by Tuesday. Nothing accumulates, so the same mistakes recur and the same reasoning is paid for again on every query.
- **Errors are silent.** A wrong number and a right number look identical in a chat window. A missing join condition doesn't crash; it quietly doubles the total. The failure mode isn't an error message, it's a confident answer that is off by 30%.
- **Nothing is auditable.** When someone challenges a figure, there is a wall of generated SQL and no explanation of what was assumed. "Where did this come from" has no good answer.
- **Time is treated as an afterthought.** Questions like "what did this look like in March" or "what did we believe when we approved this" are asked constantly and answered badly, because the underlying tables usually record only the present.

The business risk is not that the agent fails. It is that it succeeds *plausibly*, and decisions get made on numbers nobody can trace.

## What Synalog does about it

Synalog puts a layer of **named business concepts** between the agent and the raw tables.

Instead of rediscovering what a customer is on every question, the vocabulary is stated once:

- `ActiveCustomer` is a concept, not a `WHERE` clause someone has to remember.
- `WorksIn`, `Supplies`, `ReportsTo` are relationships, not join conditions to be reinvented.
- "Revenue recognised this quarter" is a rule other rules can build on.

Three properties make that layer worth having:

1. **The agent writes it.** A traditional semantic layer is a modeling project: months of work by data engineers, frozen once delivered, out of date shortly after. Synalog's layer is authored at inference time by the agent itself, and it grows as questions get asked. There is no two-year prerequisite.
2. **Unsound rules are rejected before they run.** Synalog [verifies](verification.md) every rule at compile time. A rule that is structurally broken never reaches the database, so a whole class of silent wrongness is caught up front rather than discovered in a board meeting.
3. **It runs on the warehouse you already have.** Rules compile to SQL for [DuckDB, SQLite, PostgreSQL, BigQuery, Trino, Presto or Databricks](engines.md). No data is copied, no new system is deployed, no pipeline has to be maintained. The layer is a translation step, not a storage tier.

Where it sits:

```text
   source systems            your existing warehouse           the agent
  ┌───────────────┐         ┌───────────────────────┐       ┌────────────┐
  │ CRM, ERP,     │  ──►    │  tables (unchanged)   │  ◄──  │  asks in   │
  │ logs, files   │         │                       │  SQL  │  language  │
  └───────────────┘         └───────────▲───────────┘       └─────▲──────┘
                                        │ compiled SQL            │
                              ┌─────────┴───────────┐             │
                              │  Synalog rule base  │ ◄───────────┘
                              │  concepts • edges   │  reads and writes
                              │  rules • time       │  its own vocabulary
                              └─────────────────────┘
```

Nothing moves. The rule base is text, versioned like code, and it is the only new artifact.

## What changes in practice

| Before | After |
|---|---|
| The definition of a metric lives in someone's head, a dashboard and three notebooks, and they disagree. | It lives in one named rule that everything else references. Disagreement becomes visible instead of latent. |
| Every question is a fresh SQL generation, with a fresh chance of being subtly wrong. | Questions are short expressions over concepts that were already validated by earlier use. |
| A bad rule is discovered when a human notices the number looks odd. | A structurally bad rule is rejected at compile time, before the query runs. |
| "Where does this number come from?" ends in generated SQL. | It ends in a chain of named rules leading back to source tables. |
| Relationship questions ("who is exposed to this supplier?") are bespoke join chains. | They are traversals over [entities and relationships](knowledge-graphs.md) modeled once. |
| "What did this look like in March?" is a bespoke query written from scratch. | It is a [point-in-time filter](knowledge-graphs.md#temporal-graphs) over edges that already carry their validity period. |
| Agent knowledge resets between sessions. | The rule base *is* the memory, and it compounds. |

The compounding is the part that matters commercially. The first ten questions cost more than they would with direct SQL generation, because concepts are being defined. The next thousand cost dramatically less, because they are being reused. A semantic layer is an asset with a payback period, not a running expense.

## Where it pays off first

Synalog earns its place where questions are **relational, definitional or historical**:

- **Regulated reporting.** Numbers have to be reproducible months later, from a definition that is written down rather than reconstructed. See [temporal graphs](knowledge-graphs.md#temporal-graphs).
- **Risk and exposure.** "Which customers depend on this supplier, directly or through two hops?" is a traversal, and a fragile one to write by hand each time.
- **Access, org and entitlement questions.** Hierarchies, delegation chains and approval paths are recursive by nature and notoriously wrong in hand-written SQL.
- **Customer and account views.** The same entity assembled from a CRM, a billing system and a support tool, defined once instead of per query.
- **Fraud and anomaly patterns.** Shared attributes, rings and indirect connections are graph questions asked of relational tables.
- **Any domain with a contested vocabulary.** Wherever "what counts as X" is genuinely disputed between teams, writing it down as a rule forces and records the decision.

## What Synalog is not

Being honest about the boundaries is more useful than a longer feature list.

- **It is not a database.** It stores nothing and executes nothing. All performance, cost and scale characteristics are those of the engine underneath. A slow warehouse stays slow.
- **It does not fix bad data.** A semantic layer makes disagreement explicit; it does not reconcile it. If two systems disagree about a customer's status, you now have a rule that has to choose, which is progress, but the choice is still yours.
- **It does not read unstructured text.** Contracts, tickets and PDFs must be turned into rows first. An agent can do that extraction, but Synalog's input is tabular.
- **Verification is structural, not semantic.** The [verifier](verification.md) proves a rule is well-formed, safe and terminating. It cannot know whether "active customer" means what your CFO means. Rules that will be relied on for reporting still need human review, exactly like code.
- **It does not write back to source systems.** It derives; it does not update your CRM.
- **It is a language.** Someone has to read it. The syntax is small and SQL knowledge transfers, but the mental model (rules that compose, not queries that stand alone) is a genuine learning curve for a team, and [differs from both SQL and classical Datalog](differences-datalog.md).
- **Recursion is bounded on purpose.** Traversal depth is declared explicitly, which guarantees termination and means you have to pick a bound. Unbounded graph algorithms are out of scope.


## How it compares to the alternatives

Most teams are choosing between five things. None of them is wrong; they solve different problems.

| Approach | Best when | Why teams move off it |
|---|---|---|
| **Direct text-to-SQL** | One-off exploration, small schemas, an expert reviewing every query. | Definitions never accumulate, errors are silent, no audit trail. |
| **Hand-built BI semantic layer** (LookML, dbt metrics, Cube) | A stable, well-understood set of governed metrics with a data team to maintain them. | Human-authored and slow to change; an agent can read it but cannot extend it mid-conversation, so anything unmodeled falls back to raw SQL. |
| **Graph database** (Neo4j and similar) | Deep or unbounded traversals, interactive path queries, graph algorithms like community detection. | Requires copying data out of the warehouse, keeping it in sync, and operating a second system. Analytical aggregation is not its strength. |
| **RDF / OWL triple store** | Standards-based ontologies shared across organizations, formal reasoning over classes. | Heavy modeling ceremony, a separate stack, and a mismatch with tables where the data actually lives. |
| **Vector search / RAG** | Questions over documents and prose. | Cannot compute. "Sum revenue by region for active accounts" is not a retrieval problem. |

Synalog's position: **a semantic and graph layer that lives in the warehouse, is cheap enough to write at inference time, and is verified before it executes.** It complements rather than replaces RAG (documents on one side, structured facts on the other) and can sit alongside an existing BI layer rather than competing with it.

Also worth naming: a **classical in-memory Datalog engine** solves a similar reasoning problem but requires loading the facts into its own process. Synalog gives up incremental in-memory evaluation to gain warehouse scale and zero data movement. That trade is discussed in [Differences with Datalog](differences-datalog.md).

## What adoption actually looks like

It is deliberately incremental. Nothing here requires a migration.

1. **Point it at one schema.** Pick a domain where questions are frequent and definitions are argued about. Define ten to twenty concepts: the entities, the two or three relationships that matter, the handful of contested metrics.
2. **Let the agent extend it.** Every question that cannot be answered from existing concepts produces new ones. Those are validated automatically and reviewed by a human before being promoted to trusted status.
3. **Add relationships once the entities settle.** Turning existing tables into a [knowledge graph](knowledge-graphs.md) is a modeling step, not a migration; the graph is virtual and always as fresh as the tables.
4. **Add time where it pays.** Most relations never need it. A few (the ones subject to disputes or reporting obligations) justify [validity periods](knowledge-graphs.md#choosing-a-time-model).
5. **Treat the rule base as code.** Version it, review it, test it. It is the most valuable artifact the project produces, and it outlives whichever model is generating queries this year.

## Where to go next

- [Getting started](getting-started.md): install it and run a program in a few minutes.
- [Knowledge graphs](knowledge-graphs.md): the modeling guide, including graph and time-model trade-offs.
- [Language](language/index.md): the full reference.
- [Verification](verification.md): what is checked before anything runs.
