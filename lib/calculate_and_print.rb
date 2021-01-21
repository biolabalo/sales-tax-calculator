
require_relative '../lib/calculator'
require_relative '../lib/printer'
require_relative '../lib/transform'
require_relative '../lib/input'

class ComputeSalesWithTax

  attr_reader :items

  def initialize(filename)
    @filename = filename
  end

  def input(filename)
    file = Input.new(filename)
  end

  def calc(list)
    costs = Calculator.new(list)
    costs.execute
    return costs
  end

  def print(items, sales_tax, total)
    show = Printer.new(items, sales_tax, total)
    show.execute
    return show
  end

  def compute_and_print
    input = input(@filename)
    list = Transform.new(input.items)
    list.generate
    calculate = calc(list.items)
    print(calculate.items, calculate.sales_tax, calculate.total_all)
  end 

end
   