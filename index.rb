require_relative './lib/printer'
require_relative './lib/transform'
require_relative './lib/calculator'
require_relative './lib/calculate_and_print'




# get name of file passed through the terminal and run the program
filename = ARGV.first

if filename && ['input1.txt', 'input2.txt', 'input3.txt'].include?(filename)
  ComputeSalesWithTax.new(filename).compute_and_print
else
  puts "Pass in either input1.txt, input2.txt or input3.txt"
end

