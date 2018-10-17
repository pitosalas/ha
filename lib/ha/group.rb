class Group
  attr_reader :type, :on, :name, :lights
  def initialize(key, hashvalue)
    @type = hashvalue["type"]
    @lights_s = hashvalue["lights"].join(",")
    @lights = hashvalue["lights"]
    @name = hashvalue["name"]
    @hashvalue = {"key" => key, "on" => @lights_s, "name" => @name, "type" => @type}
  end

  def get_array(selectors)
    selectors.map { |key| @hashvalue[key] }
  end

  def self.owning(number, grouparray)
    grouparray.select { |group| group.lights.include? number}
  end

end