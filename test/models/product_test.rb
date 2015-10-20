require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	def setup
		@test_product = build(:product)
	end

  test "should not save product without a name" do
  	assert @test_product.save
  end

end
