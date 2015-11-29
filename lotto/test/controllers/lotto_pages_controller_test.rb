require 'test_helper'

class LottoPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Etusivu | Lottosivut"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Apua | Lottosivut"
  end
    
  test "should get about" do
      get :about
      assert_response :success
      assert_select "title", "Tietoa | Lottosivut"
  end
    
  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Yhteystiedot | Lottosivut"
  end
end
