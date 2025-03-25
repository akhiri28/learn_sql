/*
Arthematic
----------
+	Add	
-	Subtract	
*	Multiply	
/	Divide	
%	Modulo	

Comparison
----------
=	Equal to	
>	Greater than	
<	Less than	
>=	Greater than or equal to	
<=	Less than or equal to	
<>	Not equal to

Compound
--------
+=	Add equals
-=	Subtract equals
*=	Multiply equals
/=	Divide equals
%=	Modulo equals

Logical Operators
-----------------
ALL	        TRUE if all of the subquery values meet the condition	
ANY	        TRUE if any of the subquery values meet the condition	
EXISTS	    TRUE if the subquery returns one or more records	
SOME	    TRUE if any of the subquery values meet the condition

AND	        TRUE if all the conditions separated by AND is TRUE	
BETWEEN	    TRUE if the operand is within the range of comparisons	
IN	        TRUE if the operand is equal to one of a list of expressions	
LIKE	    TRUE if the operand matches a pattern	
NOT	        Displays a record if the condition(s) is NOT TRUE	
OR	        TRUE if any of the conditions separated by OR is TRUE	
*/

-- Tables to be used for learning
/*
insert into test_tbl
select app, rating from playstore;
*/
/*
create table test_tbl_1 as
select app, reviews, rating from playstore where category in ('ART_AND_DESIGN', 'BUSINESS');
*/

/*
-- Logical Operators ---

-- ALL, ANY, EXISTS, SOME

-- ALL - all data from test_tbl which has rating GREATER than GREATEST RATING of app which have reviews more than 100000.
select * from test_tbl
where rating > ALL (select rating from test_tbl_1 where reviews > 100000);

-- ANY - all data from test_tbl which has rating GREATER than LEAST RATING of app which have reviews more than 100000.
select * from test_tbl
where rating > ANY (select rating from test_tbl_1 where reviews > 100000);

-- SOME is functionally quivalent ANY.
select count(*) from test_tbl
where rating > some (select rating from test_tbl_1 where reviews > 100000);

select count(*) from test_tbl
where rating > any (select rating from test_tbl_1 where reviews > 100000);

-- EXISTS - Conditional operator in subquery seems to be must for exists operator.
select * from test_tbl
where exists (select app from test_tbl_1 where test_tbl_1.app = test_tbl.app and test_tbl_1.rating >= 4.8);
*/

-- AND	        TRUE if all the conditions separated by AND is TRUE	
-- select app, rating, reviews from playstore where rating > 4.5 and reviews > 100000;

-- OR	        TRUE if any of the conditions separated by OR is TRUE	
-- select app, rating, reviews from playstore where rating = 4.5 OR  RATING = 4;

-- BETWEEN	    TRUE if the operand is within the range of comparisons	- inclusive of both ends
-- select rating from playstore where rating between 4 and 4.2

-- IN	        TRUE if the operand is equal to one of a list of expressions	
-- select category, app from playstore where category in ('ART_AND_DESIGN', 'BUSINESS');

-- LIKE	    TRUE if the operand matches a pattern	
-- SELECT DISTINCT CATEGORY from playstore where Category like '%R%';
-- SELECT DISTINCT CATEGORY from playstore where Category like 'A%';
-- SELECT DISTINCT CATEGORY from playstore where Category like '%s';
-- SELECT DISTINCT CATEGORY from playstore where Category like '%s%a%';

-- NOT	        Displays a record if the condition(s) is NOT TRUE	
-- select distinct CATEGORY from playstore where category in ('ART_AND_DESIGN');
-- select distinct CATEGORY from playstore where category NOT in ('ART_AND_DESIGN');





