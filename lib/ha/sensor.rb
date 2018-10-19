require_relative "hue_resource"

class Sensor < HueResource
  attr_reader :type, :on, :name

  def initialize(key, hashvalue)
    super
    key = analyze_type @type
    @on = hashvalue.dig("state", key)
    @state.merge! ({"key" => key, "on" => @on})
  end

  def get_array(selectors)
    selectors.map { |key| @state[key] }
  end

  def analyze_type type
    key = "status"
    if type == "CLIPPresence"
      key = "presence"
    elsif type == "Geofence"
      key = "presence"
    elsif type == "CLIPGenericFlag"
      key = "flag"
    elsif type == "Daylight"
      key = "daylight"
    end      
    key
  end

end