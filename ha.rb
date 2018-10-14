#!/usr/bin/env ruby

require 'thor'
require 'yaml'
require 'byebug'

class Hue < Thor
  desc "list", "list Hue items"
  def list
    puts "listing hue"
  end

  desc "pair", "run pairing process to allow you to access the hue bridge"
  def pair
    puts "Pairing... Run over to the bridge, and press the button"
  end
end
  

CONFIG_FILE_SPEC = "#{Dir.home}/.ha"
class Ha < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end

  desc "hue SUBCOMMAND", "commands for working with Philips Hue"
  subcommand "hue", Hue

  def self.setup
    puts "setting up environment"
    if File.exists? CONFIG_FILE_SPEC
      myfile = File.open(CONFIG_FILE_SPEC, "r")
      @config = YAML.load(myfile.read) 
    end
    @config ||= {}
  end

  def self.save
    puts "saving state"
    @config[:name] += "Salas"
    myfile = File.open(CONFIG_FILE_SPEC, "w")
    myfile.write(@config.to_yaml)
  end
end

Ha.setup
Ha.start(ARGV)
Ha.save