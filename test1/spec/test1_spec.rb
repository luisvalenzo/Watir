load File.dirname(__FILE__) + '/../test_helper.rb'

describe "Test Suite" do
  include TestHelper

  before(:all) do
    # open_browser will try reuse existing IE window if possible.
    open_browser(:browser => browser_type)
  end

  after(:all) do
    close_browser unless debugging?
  end

  test_case "New Test Case" do
    # Test Steps go here
    goto_url("about:home")
    enter_text("username", "agileway")
    enter_text("password", "testwise")
    click_button("Sign in")
    click_link("Sign off")
  end

end
