require 'watir-webdriver'
require 'rspec'
require 'rubygems'


browser = Watir::Browser.new :ie
browser.goto("http://travel.agileway.net/login")


    # Test Steps go here
    browser.text_field(:id, "username").set("agileway")
    browser.text_field(:id, "password").set("testwise")
    browser.button(:value,"Sign in").click
    #sleep 2
    browser.element(:name,"Signed in!").wait_until_present
    if browser.text.include?("Signed in!")
	put "Signed in! is displayed"
    end
    if browser.text.include?("Select Flight")
	put "Select Flight is displayed"
    end
    #browser.radio(:name => "tripType", :value => "oneway").wait_until_present
    browser.radio(:name => "tripType", :value => "oneway").click
    browser.radio(:name => "tripType", :value => "return").click
    browser.select_list(:name, "fromPort").select("New York")
    browser.select_list(:name, "toPort").select("Sydney")
    browser.select_list(:id, "departDay").select("02")
    browser.select_list(:id, "departMonth").select("Feburary 2012")
    browser.select_list(:id, "returnDay").select("02")
    browser.select_list(:id, "returnMonth").select("March 2012")
    browser.button(:value,"Continue").click
    browser.element(:name,"Passenger Details").wait_until_present
    if browser.text.include?("Passenger Details")
	puts "Passenger Details is displayed"
    end
    browser.text_field(:name, "passengerFirstName").set("Jose Luis")
    browser.text_field(:name, "passengerLastName").set("Diaz")
    browser.button(:value,"Next").click
    sleep 1
    browser.element(:name,"Pay by Credit Card").wait_until_present
    if browser.text.include?("Pay by Credit Card")
	puts "Pay by Credit Card is displayed"
    end
    browser.radio(:name => "card_type", :value => "master").click
    browser.radio(:name => "card_type", :value => "visa").click
    #expect(browser.text_field(:name, "holder_name").value).to eq("Jose Luis Diaz")
    if browser.text_field(:name, "holder_name").value == "Jose Luis Diaz"
    	puts "Jose Luis Diaz is displayed"
    end
    browser.text_field(:name, "card_number").set("1212121212121212")
    browser.select_list(:name, "expiry_month").select("02")
    browser.select_list(:name, "expiry_year").select("2016")
    browser.button(:value,"Pay now").click
    #sleep 1
    #Watir::Wait.until { browser.text.include?("Confirmation")}
    browser.element(:text,"Confirmation").wait_until_present
    if browser.text.include?("Confirmation")
	puts "Confirmation is displayed"
    end
    if browser.element(:id,"booking_number").exist?
	puts browser.element(:id,"booking_number").attribute_value ("outertext")
    browser.link(:text, "Sign off").click
