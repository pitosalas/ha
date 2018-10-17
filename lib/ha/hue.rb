require 'json'
require 'faraday'
require 'ha/sensor'
require 'ha/light'
require 'ha/group'

BRIDGE_IP = "10.0.0.89"
USERNAME = "3ClrGgbS5Nm9x2tc3Kbr7DxkaFvvqmewswPT5xzI"


class Hue
  attr_accessor :context

  def initialize(context)
    @context = context
    @conn = Faraday.new(url: "http://#{BRIDGE_IP}")
    @groups = get_groups
    @sensors = get_sensors
    @lights = get_lights
  end

  def pair
    @context[:useraccount] = "12345"
    @context.save
  end

  def get_sensors
    get = @conn.get("/api/#{USERNAME}/sensors")
    parsed = JSON.parse(get.body)
    parsed.to_a.map { |sensor_pair| Sensor.new(*sensor_pair)}
  end

  def get_lights
    get = @conn.get("/api/#{USERNAME}/lights")
    parsed = JSON.parse(get.body)
    parsed.to_a.map { |light_pair| Light.new(*light_pair, @groups)}
  end

  def get_groups
    get = @conn.get("/api/#{USERNAME}/groups")
    parsed = JSON.parse(get.body)
    parsed.to_a.map { |group_pair| Group.new(*group_pair)}
  end


  def get_sensors_a selector
    get_sensors.map { |sensor| sensor.get_array(selector)}
  end

  def get_lights_a selector
    get_lights.map { |light| light.get_array(selector)}
  end

  def get_groups_a selector
    get_groups.map { |group| group.get_array(selector)}
  end

end
