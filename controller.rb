require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative ('./models/transaction')
require_relative ('./models/category')


get '/transactions' do
   @transactions = Transaction.all()

   @total = Transaction.total()

   #returns all trasactions for each of the categories
   all_categories = Category.all.map.with_index do |category,i|
      Category.all[i].transactions
   end

   # remove empty category arrays
   filtered_categories = all_categories.select do |category|
      category.any?
   end

   #calculate total trasactions for each category
   @a = filtered_categories.map do |category|
      category_total = 0
      category.each do |t|
         category_total += t.amount
      end
      data = {}
      data['name'] = category[0].category
      data['total'] = category_total
      data
   end

   erb( :index )
end

get '/transactions/new' do
   @categories = Category.all()
   erb( :new )
end

get '/transactions/:id' do
   @transaction = Transaction.find(params['id'])
   erb( :show )
end

post '/transactions' do
   @transaction = Transaction.new(params)
   @transaction.save()
   erb( :create )
end

post '/transactions/:id/delete' do
   transaction = Transaction.find(params['id'])
   transaction.delete()
   erb( :delete )
end
