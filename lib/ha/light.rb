require_relative "hue_resource"
class Light < HueResource
  
  attr_reader :type, :on, :name

  def initialize(key, hashvalue, grouparray)
    super(key, hashvalue)
    @grouparray = grouparray
    @onstate = hashvalue.dig("state", "on")
    @brightstate = hashvalue.dig("state", "bri")
    @combinedsate = "#{@onstate} (#{@brightstate})"
    @number = key
    @group = Group.owning(key, grouparray)
    @state.merge! ({"key" => key, "on" => @combinedsate})
  end

  def build_name hashvalue
    hashvalue["name"] + " [" + Group.owning(@number, @grouparray).first.name + "]"
  end
  def get_array(selectors)
    selectors.map { |key| @state[key] }
  end
end