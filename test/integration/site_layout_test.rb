require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

  end

  test "checking titles" do
    get contact_path
    assert_select "title", full_title("Contact")
    get about_path
    assert_select "title", full_title("About")
    get help_path
    assert_select "title", full_title("Help")
    get root_path
    assert_select "title", full_title("Home")
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
