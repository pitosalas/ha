require_relative "hue_resource"
class Rule  < HueResource

  attr_reader :type, :on, :name, :lights
  def initialize(key, hashvalue)
    super
    @rules = hashvalue["rules"]
    gen_reskey("rul  ")
    @state.merge! ({"on" =>@lights_s, "name" => @name, "type" => @type})
  end

  def get_array(selectors)
    selectors.map { |key| @state[key] }
  end

  def self.owning(number, grouparray)
    grouparray.select { |group| group.lights.include? number}
  end
end