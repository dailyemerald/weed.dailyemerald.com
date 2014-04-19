require 'test_helper'

class AppControllerTest < ActionController::TestCase
  test "should get form_submit" do
    get :form_submit
    assert_response :success
  end

  test "should get submit" do
    get :submit
    assert_response :success
  end

end
