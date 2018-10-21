class HueResource
  def initialize(key, hash_value)
    @hash_value = hash_value
    @lastupdated = @hash_value.dig("state", "lastupdated")
    @type = hash_value["type"]
    @name = hash_value["name"]
    @state = { "key"=> key, "lastupdated" => @lastupdated, "type" => @type, "name" => @name}
  end

  def gen_reskey(type)
    @state.merge!({ "id" => type + @state["key"]})
  end
end