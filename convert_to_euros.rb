require 'open-uri'
require 'json'

def convert_to_euros(num)
  file = open("http://rate-exchange.appspot.com/currency?from=USD&to=EUR&q=1")
  result = JSON.load(file.read)

  num * result["rate"]
end

puts convert_to_euros(1)
puts convert_to_euros(25)