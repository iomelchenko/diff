class ComparedObject
  def initialize(file)
    @file = file
  end

  def lines_array
    File.readlines(@file).map { |line| line.gsub("\n", "") }
  end
end
