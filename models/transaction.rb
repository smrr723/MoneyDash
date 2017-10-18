require_relative('../db/sql_runner')

class Transaction

attr_reader :id
attr_accessor :name, :amount, :category_id, :time_added

def initialize( options )
   @id = options['id'].to_i if options['id']
   @name = options['name']
   @amount = options['amount'].to_i
   @category_id = options['category_id'].to_i
   @time_added = DateTime.now
end


def self.total()
   total_amount = 0
   transactions = Transaction.all()
   transactions.each do |transaction|
      total_amount += transaction.amount
   end
   return total_amount
end

# CRUD Operations

def save()
   sql = "INSERT INTO transactions (name, amount, category_id, time_added) VALUES ($1, $2, $3, $4) RETURNING id"
   values = [@name, @amount, @category_id, @time_added]
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

def category()
  sql = "SELECT categories.name FROM categories WHERE id = $1;"
  values = [@category_id]
  result = SqlRunner.run(sql, values).first
  return result['name']
end

def house()
  sql = "SELECT houses.name FROM houses WHERE id = $1;"
  values = [@house_id]
  result = SqlRunner.run(sql, values).first
  return result['name']
end

def delete()
  sql = "DELETE FROM transactions WHERE id = $1;"
  values = [@id]
  SqlRunner.run(sql, values)
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
