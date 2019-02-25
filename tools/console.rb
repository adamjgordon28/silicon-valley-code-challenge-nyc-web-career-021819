require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
facebook = Startup.new("Facebook", "Zuck", "Social Media")
uber = Startup.new("Uber", "Travis K", "Rideshare")
twitter = Startup.new("Twitter", "Jack D", "Social Media")

skyhawk = VentureCapitalist.new("SkyHawk", 20000000000)
capitalone = VentureCapitalist.new("Capital One", 1300000000000)
brokeguys = VentureCapitalist.new("Broke Guys", 20)
twitter.sign_contract(skyhawk, "Series C", 10000000)
uber.sign_contract(brokeguys, "Angel", 10)
twitter.sign_contract(brokeguys, "Seed", 10)
facebook.sign_contract(capitalone, "Seed", 150000000)
facebook.sign_contract(skyhawk, "Series C", 200000)
uber.sign_contract(brokeguys, "Angel", 10)
uber.sign_contract(brokeguys, "Angel", 10)
uber.sign_contract(brokeguys, "Angel", 10)
facebook.sign_contract(brokeguys, "Series Z", 15)
brokeguys.offer_contract(facebook,"Series Q", 15)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
