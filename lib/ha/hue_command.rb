require_relative 'cli_table'
require_relative 'hue'

class HueCommand < Thor
  desc "list", "list Hue items"
  
  def list
    hue = Hue.new(context, Hue.get_bridge_state)
    items = hue.get_all_a list_headers
    table = CliTable.new
    table.headers = list_headers
    table.rows =  hue.get_all_a list_headers
    puts table.render
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
    ["id", "name", "type", "on"]
  end
  
end