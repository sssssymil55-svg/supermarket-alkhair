PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS products (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT NOT NULL,
 category TEXT NOT NULL DEFAULT '',
 price INTEGER NOT NULL CHECK(price >= 0),
 stock INTEGER NOT NULL DEFAULT 0 CHECK(stock >= 0),
 image_url TEXT NOT NULL DEFAULT '',
 description TEXT NOT NULL DEFAULT '',
 active INTEGER NOT NULL DEFAULT 1,
 updated_at TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS orders (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 customer_name TEXT NOT NULL,
 phone TEXT NOT NULL,
 address TEXT NOT NULL,
 notes TEXT NOT NULL DEFAULT '',
 subtotal INTEGER NOT NULL,
 shipping INTEGER NOT NULL DEFAULT 1000,
 total INTEGER NOT NULL,
 status TEXT NOT NULL DEFAULT 'جديد',
 items_summary TEXT NOT NULL DEFAULT '',
 created_at TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS order_items (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 order_id INTEGER NOT NULL REFERENCES orders(id),
 product_id INTEGER,
 product_name TEXT NOT NULL,
 unit_price INTEGER NOT NULL,
 quantity INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_products_active ON products(active);
CREATE INDEX IF NOT EXISTS idx_orders_created ON orders(created_at);
