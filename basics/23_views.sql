/*
In databases, a view is a virtual table that is based on the result of a SQL query.

It looks like a table but doesn’t store data itself.

Instead, it shows data from one or more real tables.

When you query a view, it runs the underlying SQL to fetch data in real time.

Why are views required:
1. Simplify complex queries.
2. Improve Security - You can restrict access to certain columns or rows by giving users access to a view instead of the full table.
3. Reusability - Once defined, a view can be reused in multiple queries, reducing duplication.
4. Data consistency - If multiple teams or apps need the same logic, a view ensures they all get consistent results.
5. Logical Seperation - Views are way to abstract data base schema. Even if the underlying table changes. The end user wont get effected if you modify the Views being used.

*/

create view playstore_view
as 
select app, category, rating, reviews
from playstore;

select * from playstore_view;

