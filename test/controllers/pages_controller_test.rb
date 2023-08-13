require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contacts" do
    get pages_contacts_url
    assert_response :success
  end

  test "should get service" do
    get pages_service_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end
end
