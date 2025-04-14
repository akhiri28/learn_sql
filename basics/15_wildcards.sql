/*
Wildcard	Description	                             Example
%	        Matches zero or more characters	         'a%' → Starts with 'a'
_	        Matches exactly one character	         'a_' → Starts with 'a' and has one more character
[ ]	        Matches one character from a set	     'H[aeiou]llo' → Matches 'Hello', 'Hallo'             - does not support in mysql.
[^ ] or !	Matches one character NOT in the set	 'H[^aeiou]llo' → Matches 'Hillo' but not 'Hello'
- (range)	Matches one character in a range	     '[A-Z]%' → Starts with an uppercase letter           - does not support in mysql
*/

select app from playstore
where app like 'a%'; -- app name starts with p.

select app from playstore
where app like '%p';-- app name starts with a.

select app from playstore
where app like '%ap%';-- app have letters ap in between.

select app from playstore
where app like '%a_p%';

select distinct category from playstore
where category regexp '^[c]'; -- wild card [] does not work in mysql. Use regexp to use []

select distinct app from playstore
where app regexp '[0-9]'; -- wild card [] does not work in mysql. Use regexp to use []

select distinct app from playstore
where app regexp '[a-c]$'; -- wild card [] does not work in mysql. Use regexp to use []

select distinct app from playstore
where app regexp '^[^a-z]'; -- wild card [] does not work in mysql. Use regexp to use []
