require 'watir-webdriver'
require 'rspec'
require 'rubygems'


browser = Watir::Browser.new :ie
browser.goto("http://travel.agileway.net/login")