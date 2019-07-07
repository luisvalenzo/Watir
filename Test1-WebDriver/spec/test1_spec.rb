load File.dirname(__FILE__) + '/../test_helper.rb'

describe "Test Suite" do
  include TestHelper

  before(:all) do
    #site_url="http://newtours.demoaut.com/mercurywelcome.php"
    @browser = Watir::Browser.new :Chrome
    @browser.goto(site_url)
  end

  after(:all) do
    @browser.close unless debugging?
  end

  it "New Test Case" do
    # Test Steps go here
    @browser.text_field(:name, "userName").set("test")

    @browser.text_field(:name, "password").set("test")

    @browser.button(:src,"http://newtours.demoaut.com/images/btn_signin.gif?osCsid=8df049753e02761ea820266674fbe421").click

    @browser.link(:text, "SIGN-OFF").click

  end

end
