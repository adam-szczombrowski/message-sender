require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get display" do
    get :display
    assert_response :success
  end

  test "should get send_to_queue" do
    get :send_to_queue
    assert_response :success
  end

end
