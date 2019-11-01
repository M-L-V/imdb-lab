require('pg')
require_relative('../db/sql_runner.rb')

class Stars

attr_reader :first_name, :last_name, :id

def initialize(options)
  @first_name = options['first_name']
  @last_name = options['last_name']
  @id = options['id'].to_i if options['id']
end

def save
  db = PG.connect({
    dbname: 'imdb_lab',
    host: 'localhost'
    })
    sql = "INSERT INTO stars (
    first_name , last_name)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@first_name, @last_name]
    @id = SqlRunner.run( sql, values)[0]['id'].to_i
end



end 
