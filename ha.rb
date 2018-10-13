#!/usr/bin/env ruby
require 'thor'
require 'yaml'
require 'byebug'

class Ha < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end

  desc "pair", "run pairing process to allow you to access the hue bridge"
  def pair
    puts "Pairing... Run over to the bridge, and press the button"
  end

  def self.setup
    @config_file_spec = "#{Dir.home}/.ha"
    puts "setting up environment"
    if File.exists? @config_file_spec
      myfile = File.open(@config_file_spec, "r")
      @config = YAML.load(myfile.read)
    else
      @config = {}
    end
  end

  def self.save
    puts "saving state"
    byebug
    @config[:name] = "Pito"
    myfile = File.open("~/.ha", "w")
    myfile.write(@config.to_json)
  end
end


Ha.setup
Ha.start(ARGV)
Ha.save