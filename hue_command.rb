require_relative 'hue'
require 'terminal-table'

class HueCommand < Thor
  desc "list", "list Hue items"
  def list
    hue = Hue.new(context)
    items = hue.get_sensors_a
    items += hue.get_lights_a
    items += hue.get_groups_a
    puts Terminal::Table.new rows:items, headings: hue.list_headers
  end

  desc "pair", "run pairing process to allow you to access the hue bridge"
  def pair
    Hue.new(context).pair
  end

  private
  def context
    Context.new
  end
end