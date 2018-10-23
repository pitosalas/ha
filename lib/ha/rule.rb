require_relative "hue_resource"
class Rule  < HueResource

  attr_reader :detail, :on, :name, :lights
  def initialize(key, hashvalue)
    super(key, hashvalue)
    @detail = "#{hashvalue["conditions"].length} conds => #{hashvalue["actions"].length} acts"
    @state.merge! ({"on" => @hash_value["status"], "name" => @name, "detail" => @detail})
    gen_reskey("r")
  end

  def array(selectors)
    selectors.map { |key| @state[key] }
  end

  def self.owning(number, grouparray)
    grouparray.select { |group| group.lights.include? number}
  end
end
