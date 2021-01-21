class Input
  attr_reader :items

  def initialize(filename)
    @items = itemize(filename)
  end

  def itemize(filename)
    File.readlines("./inputs/#{filename}");
  end

end