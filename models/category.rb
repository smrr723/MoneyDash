require_relative('../db/sql_runner')

class Category

attr_reader :id
attr_accessor :name

def initialize( options )
   @id = options['id'].to_i if options['id']
   @name = options['name']
end

# CRUD Operations

def save()
   sql = "INSERT INTO categories (name) VALUES ($1) RETURNING id"
   values = [@name]
   category = SqlRunner.run(sql, values).first
   @id = category['id'].to_i
end

def self.delete_all()
   sql = "DELETE FROM categories"
   values = []
   SqlRunner.run(sql, values)
end


end
