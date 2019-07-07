load File.dirname(__FILE__) + '/../test_helper.rb'

describe "Test Suite" do
  include TestHelper

  before(:all) do
    @browser = Watir::Browser.new
    @browser.goto(site_url)
  end

  after(:all) do
    #@browser.close unless debugging?
  end

  it "New Test Case" do
    # Test Steps go here
    browser.text_field(:id, "username").set("agileway")
    browser.text_field(:id, "password").set("testwise")
    browser.button(:value,"Sign in").click
    browser.radio(:name => "tripType", :value => "oneway").click
    browser.radio(:name => "tripType", :value => "return").click
    puts browser.text.include?("Signed in!")
    puts browser.text.include?("Select Flight")
    browser.select_list(:name, "fromPort").select("New York")
    browser.select_list(:name, "toPort").select("Sydney")
    browser.select_list(:id, "departDay").select("02")
    browser.select_list(:id, "departMonth").select("Feburary 2012")
    browser.select_list(:id, "returnDay").select("02")
    browser.select_list(:id, "returnMonth").select("March 2012")
    browser.button(:value,"Continue").click
    puts browser.text.include?("Passenger Details")
    browser.text_field(:name, "passengerFirstName").set("Jose Luis")
    browser.text_field(:name, "passengerLastName").set("Diaz")
    browser.button(:value,"Next").click
    puts browser.text.include?("Pay by Credit Card")
    browser.radio(:name => "card_type", :value => "master").click
    browser.radio(:name => "card_type", :value => "visa").click
    expect(browser.text_field(:name, "holder_name").value).to eq("Jose Luis Diaz")
    browser.text_field(:name, "card_number").set("1212121212121212")
    browser.select_list(:name, "expiry_month").select("02")
    browser.select_list(:name, "expiry_year").select("2016")
    browser.button(:value,"Pay now").click
    #Wait(3)
    #Watir::Wait.until { browser.text.include?("Confirmation")}
    puts browser.text.include?("Confirmation")
    puts browser.text.include?("2112")
    #browser.link(:text, "Sign off").click
  end

end
