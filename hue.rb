require 'json'
require 'faraday'
require_relative 'sensor'
require_relative 'light'
require_relative 'group'

BRIDGE_IP = "10.0.0.89"
USERNAME = "3ClrGgbS5Nm9x2tc3Kbr7DxkaFvvqmewswPT5xzI"


class Hue
  attr_accessor :context

  def initialize(context)
    @context = context
    @conn = Faraday.new(url: "http://#{BRIDGE_IP}")
  end

  def pair
    @context[:useraccount] = "12345"
    @context.save
  end

  def list_headers
    ["name", "type", "on"]
  end

  def get_sensors
    get = @conn.get("/api/#{USERNAME}/sensors")
    parsed = JSON.parse(get.body)
    result = parsed.to_a.map { |sensor_pair| Sensor.new(*sensor_pair)}
    result
  end

  def get_lights
    get = @conn.get("/api/#{USERNAME}/lights")
    parsed = JSON.parse(get.body)
    result = parsed.to_a.map { |light_pair| Light.new(*light_pair)}
    result
  end


  def get_sensors_a
    result_a = get_sensors.map { |sensor| sensor.get_array(list_headers)}
    result_a
  end

  def get_lights_a
    result_a = get_lights.map { |light| light.get_array(list_headers)}
    result_a
  end

  def get_groups
    get = @conn.get("/api/#{USERNAME}/groups")
    parsed = JSON.parse(get.body)
    result = parsed.to_a.map { |group_pair| Group.new(*group_pair)}
    result
  end

  def get_groups_a
    result_a = get_groups.map { |group| group.get_array(list_headers)}
    result_a
  end

end
