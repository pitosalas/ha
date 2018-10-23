class HueResource
  def initialize(key, hash_value)
    @hash_value = hash_value
    @lastupdated = @hash_value.dig("state", "lastupdated")
    @detail = hash_value["type"]
    @name = hash_value["name"]
    @state = { "key" => key, "lastupdated" => @lastupdated, "detail" => @detail, "name" => @name}
  end

  def gen_reskey(detail)
    @state.merge!({ "id" => detail + @state["key"]})
  end
end