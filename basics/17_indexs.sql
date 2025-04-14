/*
An index in a database is like the index of a book — it helps you find data faster without scanning the whole table.

Why use an index?
-----------------
Without an index: The database does a full table scan to find rows → slow!
With an index: It uses the index to jump directly to matching rows → fast!

How it works?
-------------
An index is a separate data structure that stores:

      - The indexed column(s)
      - A pointer to the actual row in the table

Trade-offs:
----------
      - Speeds up SELECT queries
      - Slows down INSERT/UPDATE/DELETE (index needs updating)
      - Uses extra storage

*/
-- select * from playstore;

-- create an index
CREATE INDEX idx_app_name ON playstore(app(100)); -- TEXT and BLOB columns can be very large, so MySQL needs to know how much of the column to index
-- DROP INDEX idx_app_name ON playstore;

-- query
SELECT * FROM playstore WHERE app = 'Photo Editor & Candy Camera & Grid & ScrapBook';
