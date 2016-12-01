def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between 3 and 5 (inclusive).
  # Show the id, title, year, and score.

  Movie.select(:id, :title, :yr, :score).where(yr: 1980..1989).where(score: 3..5)
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.

  # yrs = Movie.where(score: 8..10).distinct(:yr).pluck(:yr)
  # Movie.having("score < 8").distinct(:yr).pluck(:yr)
  #Movie.where.not(Movie.select(:all).where(score: 8..10))
  # Movie.where("yr NOT IN (?)", Movie.where(score: 8..10).distinct(:yr).pluck(:yr)).distinct(:yr).pluck(:yr)
  #not(score: 8..10).distinct(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.

  Actor.select(:id, :name).joins(:movies).where("title = ?", title).order("ord ASC")
end

def vanity_projects
  # List the title of all movies in which the director also appeared as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.

  Movie.select(:id, :title, :name).joins(:actors).where("actors.id = movies.director_id").where("castings.ord = 1")
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

  # Actor.select(:id, :name).joins(:castings).group("actors.id").order("COUNT(ord != 1) DESC")
end
