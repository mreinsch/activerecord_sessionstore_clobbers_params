require 'test_helper'

class LocaleTest < ActionController::IntegrationTest
  test "root without locale redirects to locale" do
    get "/"
    assert_redirected_to "/en"
  end

  test "root with unknown locale" do
    get "/de"
    assert_response :not_found
  end

  test "root with locale should render homepage" do
    get "/en"
    assert_response :success
    assert_template "home/index"
  end

  test "some without locale redirects to locale" do
    get "/some"
    assert_redirected_to "/en/some"
  end

  test "some with unknown locale" do
    get "/de/some"
    assert_response :not_found
  end

  test "some with locale should render homepage" do
    get "/en/some"
    assert_response :success
    assert_template "home/some"
  end
end
