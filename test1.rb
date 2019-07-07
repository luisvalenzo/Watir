require 'watir'
browser = Watir::Browser.new :firefox
browser.goto "http://travel.agileway.net/login"
browser.text_field(:id, "username").set("agileway")
browser.text_field(:id, "password").set("testwise")
browser.button(:value,"Sign in").click
browser.link(:text, "Sign off").click
browser.close