class Sensor
  attr_reader :type, :on, :name
  def initialize(key, hashvalue)
    @type = hashvalue["type"]
    key = @type == "CLIPGenericStatus" ? "status" : "daylight"
    @on = hashvalue.dig("state", key)
    @name = hashvalue["name"]
    @hashvalue = {"key" => key, "on" => @on, "name" => @name, "type" => @type}
  end

  def get_array(selectors)
    selectors.map { |key| @hashvalue[key] }
  end

end