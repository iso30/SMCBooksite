require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should have new method" do
  	get :new
  	assert_response :success
  end
end
