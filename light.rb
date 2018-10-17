class Light
  attr_reader :type, :on, :name
  def initialize(key, hashvalue)
    @type = hashvalue["type"]
    @onstate = hashvalue.dig("state", "on")
    @brightstate = hashvalue.dig("state", "bri")
    @combinedsate = "#{@onstate} (#{@brightstate})"
    @name = hashvalue["name"]
    @hashvalue = {"on" => @combinedsate, "name" => @name, "type" => @type}
  end

  def get_array(selectors)
    selectors.map { |key| @hashvalue[key] }
  end
end