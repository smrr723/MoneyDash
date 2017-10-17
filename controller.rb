require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative ('./models/transaction')
require_relative ('./models/category')


get '/transactions' do
   @transactions = Transaction.all()
   @total = Transaction.total()
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
