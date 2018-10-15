require "yaml"

class Context
  FILE_SPEC = "#{Dir.home}/.ha"
  attr_accessor :context

  def initialize
    puts "loading context"
    if File.exists? FILE_SPEC
      myfile = File.open(FILE_SPEC, "r")
      @context = YAML.load(myfile.read)
    end
    @context ||= {}
  end

  def save
    puts "saving context"
    myfile = File.open(FILE_SPEC, "w")
    myfile.write(@context.to_yaml)
  end
end
