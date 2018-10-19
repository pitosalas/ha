require 'terminal-table'
require_relative 'hue'

class HueCommand < Thor
  desc "list", "list Hue items"
  
  def list
    hue = Hue.new(context, Hue.get_bridge_state)
    items = hue.get_all_a list_headers
    puts Terminal::Table.new rows:items, headings: list_headers
  end

  desc "pair", "run pairing process to allow you to access the hue bridge"
  def pair
    Hue.new(context).pair
  end

  private

  def context
    Context.new
  end
  
  def list_headers
    ["name", "type", "on"]
  end
  
end