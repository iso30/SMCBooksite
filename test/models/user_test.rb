require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user should not save without valid username" do
  	user = User.new
  	assert_not user.save
  end

  test "user should save if all fields are valid" do 
  	user = User.first
  	assert user.save
  end
end
