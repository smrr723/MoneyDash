require('minitest/autorun')
require('minitest/rg')

require_relative('../transaction')

class TransactionTest < MiniTest::Test

  def setup()
    @transaction = Transaction.new({'name' => 'SSE Hydro', 'amount' => 150.00,'category_id' => 1, 'time_added' => '01-05-2017'
       })
  end

  def test_name()
    actual = @transaction.name()
    assert_equal('SSE Hydro', actual)
  end



end
