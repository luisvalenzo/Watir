load File.dirname(__FILE__) + '/../test_helper.rb'

describe "Test Suite" do
  include TestHelper

  before(:all) do
    @browser = Watir::Browser.new(browser_type)
    @browser.goto(site_url)
  end

  after(:all) do
    @browser.close unless debugging?
  end

  it "New Test Case" do
    # Test Steps go here
  end

end
