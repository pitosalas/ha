class Super
  def initialize(number)
    puts "Super #{number}"
  end
end

class Sub < Super
  def initialize(number)
    super
    puts "Sub #{number}"
  end
end

Sub.new 100