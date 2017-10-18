require('minitest/autorun')
require('minitest/rg')

require_relative('../category')

class CategoryTest < MiniTest::Test

  def setup()
    @category = Category.new({'name' => 'Utilities'
       })
  end

  def test_name()
    actual = @category.name()
    assert_equal('Utilities', actual)
  end



end
