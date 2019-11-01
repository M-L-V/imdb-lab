require('pg')
require_relative('../db/sql_runner.rb')

class Movies

attr_reader :title, :genre, :id
attr_accessor :title, :genre

def initialize(options)
  @title = options['title']
  @genre = options['genre']
  @id = options['id'].to_i if options['id']
end

def save
  db = PG.connect({
    dbname: 'imdb_lab',
    host: 'localhost'
    })
    sql = "INSERT INTO movies (
    title , genre)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@title, @genre]
    @id = SqlRunner.run( sql, values)[0]['id'].to_i
end



def update()
   sql = "UPDATE movies SET title = $1, genre = $2 WHERE id = $3"
   values = [@title, @genre, @id]
   SqlRunner.run(sql, values)
 end


def self.all
  sql = "SELECT * FROM movies"
  movie_hashes = SqlRunner.run(sql)
  movie_objects = movie_hashes.map{|movie| Movies.new(movie)}
end


def self.delete_all()
  sql = "DELETE FROM movies"
  SqlRunner.run(sql)
end



def delete()
  sql = "DELETE FROM movies WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end




end
