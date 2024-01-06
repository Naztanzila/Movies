-- use movies;
-- select*from movies.movies;
-- select * from movies.ratings;

#SELECT movieId, COUNT(userId) AS rating_count
#FROM movies.ratings
#GROUP BY movieId
#ORDER BY rating_count DESC
#LIMIT 1;

# SELECT movieId, AVG(rating) as avg_rating from ratings
# where movieId = (select movieId from movies where title = "Terminator 2: Judgment Day (1991)")
# group by movieId;

# SELECT rating, COUNT(*) AS count
# FROM ratings
# WHERE movieId = (SELECT movieId FROM movies WHERE title = 'Fight Club (1999)')
# GROUP BY rating
# ORDER BY rating;

-- grouping user rating
#WITH RatingAggregates AS (
 #   SELECT
  #      movieId,
   #     COUNT(*) AS rating_counts,
    #    AVG(rating) AS avg_rating
   # FROM ratings
   # GROUP BY movieId
#)

-- Main query using the CTE
#SELECT
 #   m.movieId,
  #  m.title,
   # ra.rating_counts,
    #ra.avg_rating
# FROM movies AS m
# JOIN RatingAggregates AS ra ON m.movieId = ra.movieId
# WHERE ra.rating_counts > 50
# ORDER BY ra.avg_rating DESC
# LIMIT 1;

# WITH RatingAggregates AS (
  #  SELECT
   #     movieId,
    #    COUNT(*) AS rating_counts,
     #   AVG(rating) AS avg_rating
   # FROM ratings
   # GROUP BY movieId
# )
-- top 5 movie
# SELECT
 #   m.movieId,
  #  m.title,
   # ra.rating_counts,
   # ra.avg_rating
# FROM movies AS m
# JOIN RatingAggregates AS ra ON m.movieId = ra.movieId
# WHERE ra.rating_counts > 50
# ORDER BY ra.rating_counts DESC
# LIMIT 5;

-- Common Table Expression (CTE) to calculate rating aggregates
# WITH RatingAggregates AS (
 #   SELECT
 #       movieId,
  #      COUNT(*) AS rating_counts,
   #     AVG(rating) AS avg_rating
   # FROM ratings
   # GROUP BY movieId
# )

-- Finding the third most popular Sci-Fi movie based on the number of user ratings
# SELECT
  #  m.movieId,
   # m.title,
   # ra.rating_counts,
   # ra.avg_rating
# FROM movies AS m
# JOIN RatingAggregates AS ra ON m.movieId = ra.movieId
# WHERE ra.rating_counts > 50
  #   AND m.genres LIKE '%Sci-Fi%'
# ORDER BY ra.rating_counts DESC
# LIMIT 1 OFFSET 2;

# SELECT
  #  m.movieId,
   # m.title,
    # l.imdbId,
   # r.rating AS imdb_rating
# FROM
  #  movies AS m
# JOIN
  #  links AS l ON m.movieId = l.movieId
# JOIN
  #  ratings AS r ON m.movieId = r.movieId
# WHERE
  #  m.genres LIKE '%Sci-Fi%'
# ORDER BY
  #  r.rating DESC
# LIMIT 1;

-- Find the movieId of the movie with the highest IMDb rating
# SELECT
  #  m.movieId,
   # m.title,
   # l.imdbId,
   # r.rating AS imdb_rating
# FROM
  #  movies AS m
# JOIN
  #  links AS l ON m.movieId = l.movieId
#JOIN
 #   ratings AS r ON m.movieId = r.movieId
# ORDER BY
  #  r.rating DESC
# LIMIT 1;