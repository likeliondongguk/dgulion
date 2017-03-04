require 'test_helper'

class BoardsControllerTest < ActionController::TestCase
  test "should get board" do
    get :board
    assert_response :success
  end

end
