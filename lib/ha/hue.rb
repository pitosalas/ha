require 'json'
require 'faraday'
require_relative 'sensor'
require_relative 'light'
require_relative 'group'

BRIDGE_IP = "10.0.0.89"
USERNAME = "3ClrGgbS5Nm9x2tc3Kbr7DxkaFvvqmewswPT5xzI"


class Hue
  attr_accessor :context

  def initialize(context, bridge_state)
    @context = context
    @bridge_state = bridge_state
    @groups = get_groups
    @sensors = get_sensors
    @lights = get_lights
  end

  def self.get_bridge_state
    unless @bridge_state
      puts "fetch"
      conn = Faraday.new(url: "http://#{BRIDGE_IP}")
      get = conn.get("/api/#{USERNAME}/")
      @bridge_state = JSON.parse(get.body)
    end
    @bridge_state
  end

  def pair
    @context[:useraccount] = "12345"
    @context.save
  end

  def get_sensors
    parsed = @bridge_state[:sensors]
    parsed.to_a.map { |sensor_pair| Sensor.new(*sensor_pair)}
  end

  def get_lights
    parsed = @bridge_state[:lights]
    parsed.to_a.map { |light_pair| Light.new(*light_pair, @groups)}
  end

  def get_groups
    parsed = @bridge_state[:groups]
    parsed.to_a.map { |group_pair| Group.new(*group_pair)}
  end

  def get_all_a  selector
    items = get_sensors_a selector
    items += get_lights_a selector
    items += get_groups_a selector
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
