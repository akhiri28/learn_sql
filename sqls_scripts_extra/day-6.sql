/* Your boss noticed  that some rows in genres columns have multiple genres in them, 
which was creating issue when developing the  recommender system from the data 
he/she assigned you the task to clean the genres column and make two genres out of it, 
rows that have only one genre will have other column as blank. */

select * from data_for_sql.playstore;
select distinct genres from data_for_sql.playstore;

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