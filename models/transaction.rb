require_relative('../db/sql_runner')

class Transaction

attr_reader :id
attr_accessor :name, :category_id

def initialize( options )
   @id = options['id'].to_i if options['id']
   @name = options['name']
   @category_id = options['category_id'].to_i
end

# CRUD Operations

def save()
   sql = "INSERT INTO transactions (name, category_id) VALUES ($1, $2) RETURNING id"
   values = [@name, @category_id]
   transaction = SqlRunner.run(sql, values).first
   @id = transaction['id'].to_i
end

def self.all()
   sql = "SELECT * FROM transactions"
   values = []
   transactions = SqlRunner.run(sql, values)
   result = transactions.map {|transaction| Transaction.new( transaction )}
   return result
end

def self.delete_all()
   sql = "DELETE FROM transactions"
   values = []
   SqlRunner.run(sql, values)
end

end

# def delete()
# end
#
# def self.delete_all()
# end
#
# def edit()
# end
#
# def update()
# end
