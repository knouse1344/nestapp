require 'test_helper'

class IAmAnControllerTest < ActionController::TestCase
  test "should get engineer" do
    get :engineer
    assert_response :success
  end

end
