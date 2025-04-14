select * from playstore;

-- where clause
select * from playstore
where category = 'ART_AND_DESIGN';

-- where clause with and conditions
select * from playstore
where category = 'ART_AND_DESIGN' and rating = 4;

-- where clause with or conditions
select * from playstore
where category = 'ART_AND_DESIGN' or rating = 4;

-- where cluase with multiple conditions
-- and has precedence over or
select * from playstore
where Type = 'Free' or rating = 4 and reviews > 1000000;

-- we can use brackets
select * from playstore
where (Type = 'Free' or rating = 4) and reviews > 1000000;

-- NOt
select distinct category from playstore
where not category = 'ART_AND_DESIGN';
