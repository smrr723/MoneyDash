require ('pry-byebug')
require_relative('../models/transaction')
require_relative('../models/category')

Transaction.delete_all()
Category.delete_all()

category1 = Category.new({'name' => 'Utilities'
   })

category1.save()

category2 = Category.new({'name' => 'Rent/Mortgage'
   })

category2.save()

category3 = Category.new({'name' => 'Groceries'
   })
category3.save()

category4 = Category.new({'name' => 'Transport'
   })
category4.save()

category5 = Category.new({'name' => 'Other'
   })
category5.save()

transaction1 = Transaction.new({'name' => 'SSE Hydro', 'amount' => 150.00,'category_id' => category1.id
   })

transaction1.save()

transaction2 = Transaction.new({'name' => 'Virgin Media', 'amount' => 55.00, 'category_id' => category1.id
   })
transaction2.save()

transaction3 = Transaction.new({'name' => 'Aberdein Considine', 'amount' => 555.00, 'category_id' => category2.id
   })
transaction3.save()

binding.pry
nil
