select App, rating from playstore
where rating >= 4
order by rating asc, App asc;