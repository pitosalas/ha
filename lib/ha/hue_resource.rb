class HueResource
  def initialize(key, hash_value)
    @hash_value = hash_value
    @lastupdated = @hash_value.dig("state", "lastupdated")
    @type = hash_value["type"]
    @name = hash_value["name"]
    @state = {"lastupdated" => @lastupdated, "type" => @type, "name" => @name}
  end
end