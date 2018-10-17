#!/usr/bin/env ruby

require "thor"
require 'pry-byebug'
require "ha/hue_command"
require "ha/context"

class CLI < Thor
  desc "hello NAME", "say hello to NAME"

  def hello(name)
    puts "Hello #{name}"
  end

  desc "hue SUBCOMMAND", "commands for working with Philips Hue"
  subcommand "hue", HueCommand

  def self.exit_on_failure?
    true
  end
end
