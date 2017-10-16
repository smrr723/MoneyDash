require_relative('../db/sql_runner')

class Transaction

attr_reader :id
attr_accessor :name, :amount, :category_id

def initialize( options )
   @id = options['id'].to_i if options['id']
   @name = options['name']
   @amount = options['amount'].to_i
   @category_id = options['category_id'].to_i
end

# CRUD Operations

def save()
   sql = "INSERT INTO transactions (name, amount, category_id) VALUES ($1, $2, $3) RETURNING id"
   values = [@name, @amount, @category_id]
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

def self.find(id)
   sql = "SELECT * FROM transactions WHERE id = $1;"
   values = [id]
   transaction = SqlRunner.run(sql, values)
   result = Transaction.new(transaction.first)
   return result
end



end
#

# def delete()
# end
#
# def edit()
# end
#
# def update()
# end
