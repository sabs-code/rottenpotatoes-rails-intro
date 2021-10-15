class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end
  
  def self.with_ratings(ratings_list, sort)
  # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
  #  movies with those ratings
  # if ratings_list is nil, retrieve ALL movies
    if ratings_list == all_ratings
      if sort == "title"
        Movie.all.order(:title)
      elsif sort == "release_date"
        Movie.all.order(:release_date)
      else 
        Movie.all
      end
    else
      if sort == "title"
        Movie.where(rating: ratings_list).order(:title)
      elsif sort == "release_date"
        Movie.where(rating: ratings_list).order(:release_date)
      else
        Movie.where(rating: ratings_list)
      end
    end
  end
end