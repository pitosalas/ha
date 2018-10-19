class Sensor
  attr_reader :type, :on, :name
  def initialize(key, hashvalue)
    @type = hashvalue["type"]
    key = analyze_type @type
    @on = hashvalue.dig("state", key)
    @name = hashvalue["name"]
    @hashvalue = {"key" => key, "on" => @on, "name" => @name, "type" => @type}
  end

  def get_array(selectors)
    selectors.map { |key| @hashvalue[key] }
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