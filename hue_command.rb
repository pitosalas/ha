require_relative 'hue'
require 'terminal-table'

class HueCommand < Thor
  desc "list", "list Hue items"
  def list
    h = Hue.new(context)
    puts Terminal::Table.new rows: h.list, headings: h.list_headers, style: {border_x: "", border_y: "", border_i: "", border_top: "", border_bottom: "" , all_separators: false}
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