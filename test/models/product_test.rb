require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	config.include Sorcery::TestHelpers::Rails::Integration
  config.include Sorcery::TestHelpers::Rails::Controller

	def setup
		@test_product = build(:product)
    @user = users(:one)

    login_user(user = @user)
	end

  test "should not save product without a name" do
  	login_user
    assert_not @test_product.save
  end

end
