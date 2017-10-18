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

transaction1 = Transaction.new({'name' => 'SSE Hydro', 'amount' => 150.00,'category_id' => category1.id, 'time_added' => '01-05-2017'
   })
transaction1.save()

transaction2 = Transaction.new({'name' => 'Virgin Media', 'amount' => 55.00, 'category_id' => category1.id, 'time_added' => '02-06-2017'
   })
transaction2.save()

transaction3 = Transaction.new({'name' => 'Aberdein Considine', 'amount' => 555.00, 'category_id' => category2.id, 'time_added' => '03-07-2017'
   })
transaction3.save()

transaction4 = Transaction.new({'name' => 'SPT Underground', 'amount' => 50.50, 'category_id' => category4.id, 'time_added' => '03-07-2017'
   })
transaction4.save()

transaction5 = Transaction.new({'name' => 'BP Filling Stn', 'amount' => 80.20, 'category_id' => category4.id, 'time_added' => '03-07-2017'
   })
transaction5.save()

transaction6 = Transaction.new({'name' => 'Sainsburys', 'amount' => 15.34, 'category_id' => category3.id, 'time_added' => '03-07-2017'
   })
transaction6.save()
transaction7 = Transaction.new({'name' => 'Spotify', 'amount' => 7, 'category_id' => category5.id, 'time_added' => '03-07-2017'
   })
transaction7.save()
transaction8 = Transaction.new({'name' => 'Netflix', 'amount' => 7, 'category_id' => category5.id, 'time_added' => '03-07-2017'
   })
transaction8.save()
transaction9 = Transaction.new({'name' => 'Audible', 'amount' => 6, 'category_id' => category5.id, 'time_added' => '03-07-2017'
   })
transaction9.save()

binding.pry
nil
