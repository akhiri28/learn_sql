/*

Here's a comprehensive table of **SQL functions** across different categories.

---

## ** Aggregate Functions**
| **Function** | **Description** | **Example** |
|-------------|----------------|------------|
| `COUNT()` | Returns the number of rows | `SELECT COUNT(*) FROM orders;` |
| `SUM()` | Returns the total sum of a column | `SELECT SUM(price) FROM products;` |
| `AVG()` | Returns the average value | `SELECT AVG(price) FROM products;` |
| `MAX()` | Returns the maximum value | `SELECT MAX(price) FROM products;` |
| `MIN()` | Returns the minimum value | `SELECT MIN(price) FROM products;` |

---

## ** String Functions**
| **Function** | **Description** | **Example** |
|-------------|----------------|------------|
| `UPPER()` | Converts text to uppercase | `SELECT UPPER(customer_name) FROM customers;` |
| `LOWER()` | Converts text to lowercase | `SELECT LOWER(customer_name) FROM customers;` |
| `LENGTH()` | Returns length of a string | `SELECT LENGTH(customer_name) FROM customers;` |
| `CHAR_LENGTH()` | Returns number of characters in a string | `SELECT CHAR_LENGTH(customer_name) FROM customers;` |
| `SUBSTRING()` | Extracts part of a string | `SELECT SUBSTRING(customer_name, 1, 5) FROM customers;` |
| `LEFT()` | Extracts characters from the left | `SELECT LEFT(customer_name, 3) FROM customers;` |
| `RIGHT()` | Extracts characters from the right | `SELECT RIGHT(customer_name, 3) FROM customers;` |
| `CONCAT()` | Joins two or more strings | `SELECT CONCAT(first_name, ' ', last_name) FROM customers;` |
| `TRIM()` | Removes spaces from both sides | `SELECT TRIM('  SQL  ');` |
| `LTRIM()` | Removes spaces from the left | `SELECT LTRIM('  SQL');` |
| `RTRIM()` | Removes spaces from the right | `SELECT RTRIM('SQL  ');` |
| `REPLACE()` | Replaces part of a string | `SELECT REPLACE('Hello World', 'World', 'SQL');` |
| `REVERSE()` | Reverses a string | `SELECT REVERSE('SQL');` |

---

## ** Date & Time Functions**
| **Function** | **Description** | **Example** |
|-------------|----------------|------------|
| `NOW()` | Returns the current date and time | `SELECT NOW();` |
| `CURDATE()` | Returns the current date | `SELECT CURDATE();` |
| `CURTIME()` | Returns the current time | `SELECT CURTIME();` |
| `DATE()` | Extracts the date part from a timestamp | `SELECT DATE(NOW());` |
| `YEAR()` | Extracts the year | `SELECT YEAR(order_date) FROM orders;` |
| `MONTH()` | Extracts the month | `SELECT MONTH(order_date) FROM orders;` |
| `DAY()` | Extracts the day | `SELECT DAY(order_date) FROM orders;` |
| `HOUR()` | Extracts the hour | `SELECT HOUR(NOW());` |
| `MINUTE()` | Extracts the minute | `SELECT MINUTE(NOW());` |
| `SECOND()` | Extracts the second | `SELECT SECOND(NOW());` |
| `DATEDIFF()` | Finds the difference between two dates | `SELECT DATEDIFF('2024-04-01', '2024-03-01');` |
| `TIMESTAMPDIFF()` | Returns time difference in given unit | `SELECT TIMESTAMPDIFF(DAY, '2024-03-01', '2024-04-01');` |
| `DATE_ADD()` | Adds a time interval to a date | `SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY);` |
| `DATE_SUB()` | Subtracts a time interval from a date | `SELECT DATE_SUB(CURDATE(), INTERVAL 30 DAY);` |
| `LAST_DAY()` | Returns the last day of the month | `SELECT LAST_DAY(CURDATE());` |

---

## ** Numeric Functions**
| **Function** | **Description** | **Example** |
|-------------|----------------|------------|
| `ROUND()` | Rounds a number to a specified decimal places | `SELECT ROUND(15.678, 2);` |
| `FLOOR()` | Rounds down | `SELECT FLOOR(9.7);` |
| `CEIL()` | Rounds up | `SELECT CEIL(9.2);` |
| `ABS()` | Returns the absolute value | `SELECT ABS(-10);` |
| `MOD()` | Returns remainder of division | `SELECT MOD(10, 3);` |
| `POWER()` | Raises a number to a power | `SELECT POWER(2, 3);` |
| `SQRT()` | Returns square root | `SELECT SQRT(25);` |
| `EXP()` | Returns the exponential value | `SELECT EXP(1);` |
| `LOG()` | Returns natural logarithm | `SELECT LOG(10);` |

---

## ** Control Flow Functions**
| **Function** | **Description** | **Example** |
|-------------|----------------|------------|
| `IF()` | Returns a value based on condition | `SELECT IF(10 > 5, 'Yes', 'No');` |
| `CASE` | Returns different values based on conditions | ```sql SELECT customer_name, CASE WHEN country = 'USA' THEN 'Domestic' ELSE 'International' END AS region FROM customers; ``` |
| `COALESCE()` | Returns first non-null value | `SELECT COALESCE(NULL, 'Default');` |
| `NULLIF()` | Returns NULL if two expressions are equal | `SELECT NULLIF(10, 10);` |

---

## ** JSON Functions (MySQL Specific)**
| **Function** | **Description** | **Example** |
|-------------|----------------|------------|
| `JSON_OBJECT()` | Creates a JSON object | `SELECT JSON_OBJECT('name', 'John', 'age', 30);` |
| `JSON_ARRAY()` | Creates a JSON array | `SELECT JSON_ARRAY(1, 2, 3, 'Hello');` |
| `JSON_EXTRACT()` | Extracts value from JSON | `SELECT JSON_EXTRACT('{"name": "John"}', '$.name');` |
| `JSON_UNQUOTE()` | Removes quotes from JSON value | `SELECT JSON_UNQUOTE('"Hello"');` |

---

*/

SELECT JSON_OBJECT('name', 'John', 'age', 30);

SELECT NULLIF(10, 100);


/* Your boss noticed  that some rows in genres columns have multiple genres in them, 
which was creating issue when developing the  recommender system from the data 
he/she assigned you the task to clean the genres column and make two genres out of it, 
rows that have only one genre will have other column as blank. */

select * from playstore;
select distinct genres from playstore;

DELIMITER //
create function f_genre(a varchar(100))
returns varchar(100) 
deterministic
begin 
	set @f = locate(';', a);
    set @f_g = if(@f > 0, left(a, @f -1 ), a);
    -- set @l_g = if(@f > 0, right(a, @f+1 ), a);
    return @f_g;
end;
// 

DELIMITER //
create function l_genre(a varchar(100))
returns varchar(100) 
deterministic
begin 
	set @f = locate(';', a);
    -- set @f_g = if(@f > 0, left(a, @f -1 ), a);
    set @l_g = if(@f > 0, substring(a, @f+1, length(a)), '');
    return @l_g;
end;
//

select app, genres, f_genre(genres) as 'gene 1', l_genre(genres) as 'gene 2' from playstore;