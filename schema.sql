CREATE TABLE IF NOT EXISTS executions (
  broker TEXT NOT NULL,
  date TEXT NOT NULL,
  symbol TEXT NOT NULL,
  order_type INT NOT NULL,
  lot_size INT NOT NULL,
  orders INT NOT NULL,
  shares INT NOT NULL,
  cancelled INT NOT NULL,
  here_executed INT NOT NULL, -- shares executed here
  away_executed INT NOT NULL, -- shares executed away
  executed_10s INT NOT NULL,
  executed_30s INT NOT NULL,
  executed_1m INT NOT NULL,
  executed_5m INT NOT NULL,
  executed_30m INT NOT NULL,
  avg_realized_spread FLOAT NOT NULL,
  avg_effective_spread FLOAT,
  improved_shares INT,
  avg_improvement INT, -- given that improvement occurred, I think...?
  improved_latency FLOAT,
  at_quote_shares INT,
  at_quote_latency FLOAT,
  outside_quote_shares INT,
  outside_quote_avg INT,
  outside_quote_latency FLOAT,
 PRIMARY KEY (broker, date, symbol, order_type, lot_size) );
-- ... could probably use indices or something

CREATE TABLE IF NOT EXISTS codes
  ( code INTEGER PRIMARY KEY
  , shortdesc TEXT NOT NULL
  , description TEXT NOT NULL );
-- shortdesc should be unique!
-- also maybe it's a stupid idea to smash together all the categories of magic numbers
-- into one table

INSERT INTO CODES(code, shortdesc, description) VALUES
  (11, 'mkt', 'market'),
  (12, 'mktL', 'marketable limit'),
  (13, 'inQL', 'inside-the-quote limit'),
  (14, 'atQL', 'at-the-quote limit'),
  (15, 'nrQL', 'near-the-quote limit'),

  (21, '100-499', '100-499 share lots'),
  (22, '500-1999', '500-1999 share lots'),
  (23, '2000-4999', '2000-4999 share lots'),
  (24, '5000-9999', '5000-9999 share lots') ON CONFLICT DO NOTHING;
