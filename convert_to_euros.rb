require 'open-uri'
require 'json'

def convert_to_euros(num)
  file = open("http://rate-exchange.appspot.com/currency?from=USD&to=EUR&q=1")
  result = JSON.load(file.read)

  num * result["rate"]

  str = ""
  num2 = num.round(2).to_s.split("")

  str << num2.pop
  str << num2.pop
  str << num2.pop

  while num2.count > 3
      str << num2.pop
      str << num2.pop
      str << num2.pop + ","
  end
  str << num2.join("").reverse << "$"
  str.reverse

end


puts convert_to_euros(1)
puts convert_to_euros(25)
puts convert_to_euros(232354.23235)