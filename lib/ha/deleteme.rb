class Foo
  def self.play
    @y = nil
    x = defined? @x
    y = defined? @y
    puts @x
  end
end

Foo.play
