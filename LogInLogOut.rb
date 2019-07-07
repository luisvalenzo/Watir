require "watir-webdriver"
require "rspec"
require "rubygems"


browser = Watir::Browser.new :ie
browser.driver.manage.timeouts.implicit_wait = 3 
browser.goto("http://travel.agileway.net/login")
# Test Steps go here
    browser.text_field(:id, "username").set("agileway")
    browser.text_field(:id, "password").set("testwise")
    browser.button(:value,"Sign in").click
    sleep 1
    #browser.element(:name=>"Signed in!").wait_until_present
    if browser.text.include?("Signed in!")
	puts "Signed in! is displayed"
    else
	puts "Signed in! is NOT displayed"
    end
    sleep 1
    browser.link(:text, "Sign off").click
    if browser.text.include?("Signed out!")
    	puts "Signed off! is displayed"
    else
	puts "Signed off! is NOT displayed"
    end