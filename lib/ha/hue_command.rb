require 'ha/hue'
require 'terminal-table'

class HueCommand < Thor
  desc "list", "list Hue items"
  def list
    hue = Hue.new(context)
    items = hue.get_sensors_a list_headers
    items += hue.get_lights_a list_headers
    items += hue.get_groups_a list_headers
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