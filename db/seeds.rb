require ('pry-byebug')
require_relative('../models/transaction')
require_relative('../models/category')

Transaction.delete_all()
Category.delete_all()

category1 = Category.new({'name' => 'Utilities'
   })

category1.save()

transaction1 = Transaction.new({'name' => 'ELECTRICITY', 'category_id' => category1.id
   })

transaction1.save()

transaction2 = Transaction.new({'name' => 'INTERNET', 'category_id' => category1.id
   })

transaction2.save()



binding.pry
nil
