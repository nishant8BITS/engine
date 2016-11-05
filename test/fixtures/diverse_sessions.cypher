MERGE (start:Page { start: true })
MERGE (list:Page { path: "/list" })
MERGE (popular:Page { path: "/popular" })
MERGE (exit:Page { exit: true })

// Expired sessions

CREATE
  (start)  -[:SESSION { key: "skey10", count: 1, occurred_at: timestamp() - (3600 * 1000 * 10) }]->
  (list)   -[:SESSION { key: "skey10", count: 2, occurred_at: timestamp() - (3600 * 1000 * 10) }]->
  (popular)-[:SESSION { key: "skey10", count: 1, occurred_at: timestamp() - (3600 * 1000 * 10), expired_at: timestamp() - (3600 * 1000) }]->
  (exit)

CREATE
  (start)-[:SESSION { key: "skey11", count: 1, occurred_at: timestamp() - (3600 * 1000 * 8) }]->
  (list) -[:SESSION { key: "skey11", count: 1, occurred_at: timestamp() - (3600 * 1000 * 8), expired_at: timestamp() - (3600 * 1000) }]->
  (exit)

// Inactive sessions

CREATE
  (start)-[:SESSION { key: "skey20", count: 1, occurred_at: timestamp() - (3600 * 1000 * 4) }]->
  (list) -[:SESSION { key: "skey20", count: 1, occurred_at: timestamp() - (3600 * 1000 * 3) }]->
  (popular)

CREATE
  (start)-[:SESSION { key: "skey21", count: 1, occurred_at: timestamp() - (3600 * 1000 * 3) }]->
  (list) -[:SESSION { key: "skey21", count: 1, occurred_at: timestamp() - (3600 * 1000 * 2) }]->
  (popular)

// Active sessions

CREATE
  (start)-[:SESSION { key: "skey30", count: 1, occurred_at: timestamp() - (3600 * 1000) }]->
  (list) -[:SESSION { key: "skey30", count: 1, occurred_at: timestamp() - (60 * 1000 * 2) }]->
  (popular)

CREATE
  (start)-[:SESSION { key: "skey31", count: 1, occurred_at: timestamp() - (60 * 1000 * 30) }]->
  (list) -[:SESSION { key: "skey31", count: 1, occurred_at: timestamp() - (60 * 1000 * 5) }]->
  (popular)
