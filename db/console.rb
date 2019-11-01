require('pry-byebug')
require_relative('../models/movie.rb')
require_relative('../models/star.rb')

Movies.delete_all



  movie1 = Movies.new({'title' => 'The Thing', 'genre' => 'horror'})
  movie1.save


  movie2 = Movies.new({'title' => 'The Room', 'genre' => 'arthouse'})
  movie2.save


  binding.pry
  nil
