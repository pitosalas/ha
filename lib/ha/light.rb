class Light
  attr_reader :type, :on, :name

  def initialize(key, hashvalue, grouparray)
    @grouparray = grouparray
    @type = hashvalue["type"]
    @onstate = hashvalue.dig("state", "on")
    @brightstate = hashvalue.dig("state", "bri")
    @combinedsate = "#{@onstate} (#{@brightstate})"
    @number = key
    @group = Group.owning(key, grouparray)
    @name = build_name hashvalue
    @hashvalue = {"key" => key, "on" => @combinedsate, "name" => @name, "type" => @type}
  end

  def build_name hashvalue
    hashvalue["name"] + " [ " + Group.owning(@number, @grouparray).first.name + " ]"
  end
  def get_array(selectors)
    selectors.map { |key| @hashvalue[key] }
  end
end