# LearningModule

A Rails app I built to practice SQL/Active Record, database indexing, Rails caching, and Redis — implemented hands-on.

## Domain

A simple blog schema: `User`, `Category`, `Post`, `Comment`, `Like`, `Tag`/`Tagging`, plus `Product`/`Order`/`LineItem` for the indexing and transactions section.

## Docs

1. [SQL & Active Record](https://docs.google.com/document/d/1kYKKUmfUGjSUuA0IemdEes4SeRS1KZ97wHbrLCubwAQ/edit?tab=t.0) — joins, N+1 queries, eager loading, associations, transactions
2. [Database Indexing](https://docs.google.com/document/d/1GhEmUipdZ5YVU8W3DpAkGxwlzm9mRlsQat5grjDrzv8/edit?tab=t.0) — EXPLAIN ANALYZE, composite/partial indexes, selectivity
3. [Rails Caching](https://docs.google.com/document/d/1r0d9w9wayONHCf2MXu2zbyjTT8PfDJn_mYTuG_SmrTA/edit?tab=t.0#heading=h.qgyozfino5n2) — fragment caching, Russian Doll, low-level caching, query caching
4. [Redis](https://docs.google.com/document/d/14Eh89xs1RV98PApC1zBZavHlS7eLsMw2RBg-Kw6yP0Q/edit?tab=t.0) — Redis data structures, write-through/around, API response caching, monitoring

## Additional Notes

- [Git Commit Best Practices](https://docs.google.com/document/d/1waf9KCnMF3_ysMIy99LyXgAzuExiS910uc3jbpRvtV4/edit?tab=t.0)
- [RSpec Testing Guidelines, Terminology, and Best Practices](https://docs.google.com/document/d/1LUHPoH9uc0gZp3jEmkGkT9Shgb-yjnt867lBhy-xrhI/edit?tab=t.0)

## Setup

```bash
bundle install
bin/rails db:create db:migrate
bin/rails dev:cache
```

Redis must be running for module 4 (`redis-cli ping` should return `PONG`).