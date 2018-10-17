class Group
  attr_reader :type, :on, :name
  def initialize(key, hashvalue)
    @type = hashvalue["type"]
    @lights = hashvalue["lights"].join(",")
    @name = hashvalue["name"]
    @hashvalue = {"on" => @lights, "name" => @name, "type" => @type}
  end

  def get_array(selectors)
    selectors.map { |key| @hashvalue[key] }
  end
end