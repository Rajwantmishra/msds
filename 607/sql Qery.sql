SELECT * FROM movies_review;
SELECT * FROM movies_master;

select Movie_ID, avg(Rating) from movies_review group by Movie_ID;

select a.Movie_name , avg(b.rating) from movies_master as a join movies_review as b where a.ID = b.Movie_ID group by b.Movie_ID;

select user_name, count(user_name) from movies_review group by user_name  ;

select Movie_ID, count(rating) from movies_review  where rating > 5 group by movie_id ;

select Movie_ID, rating
 from movies_review  where rating > 5 ;