/*
Function                            Purpose
--------	                        -------
SUBSTRING()	                        Extracts part of a string.
LEFT(), RIGHT()	                    Extracts characters from the left or right.
CHARINDEX(), POSITION(), INSTR()	Finds position of a substring.
REPLACE()	                        Replaces occurrences of a substring.
UPPER(), LOWER()	                Changes case of a string.
LTRIM(), RTRIM(), TRIM()	        Removes spaces from strings.
CONCAT(),                           Concat Strings	
*/

-- SUBSTRING() - Extracts part of a string.
select substring('Hello SQL', 1, 5) as result;
select substring('Hello SQL', 7, 9) as result;
select distinct substring(category, 1, 5) as substring_act from playstore;

-- LEFT(), RIGHT() - Extracts characters from the left or right.
select left('Hello SQL', 5) as result;
select right('Hello SQL', 3) as result;

-- POSITION() Finds position of a substring.
select position(' ' in 'Hello SQL') as location;
select position('SQL' in 'Hello SQL') as location;

-- REPLACE()  Replaces occurrences of a substring.
select replace('Hello SQL', 'Hello',  'Welcome');
select replace('Hello SQL', left('Hello World', 5),  'Welcome');

-- UPPER(), LOWER()	Changes case of a string.
select upper('Akhilesh'), lower('Hari');

-- LTRIM(), RTRIM(), TRIM()	 Removes spaces from strings.
select length(ltrim('       hari         '));
select length(rtrim('       hari         '));
select length(('       hari         '));

-- CONCAT(),  Concat Strings	
select concat('Hello' , ' ' , 'SQL') AS RESULT;


