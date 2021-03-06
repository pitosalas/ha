require 'json'
require 'faraday'
require_relative 'sensor'
require_relative 'light'
require_relative 'group'
require_relative 'rule'

BRIDGE_IP = "10.0.0.89"
USERNAME = "78UEGUotX3otmWxbhiucELCLiiKmaD9E2O5YW-d1"


class Hue

  def initialize(context, bridge_state)
    @context = context
    @bridge_state = bridge_state
    @groups =  groups
    @sensors =  sensors
    @lights =  lights
  end

  def self.bridge_state
    unless defined? @bridge_state
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

  def sensors
    parsed = @bridge_state["sensors"]
    parsed.to_a.map { |sensor_pair| Sensor.new(*sensor_pair)}
  end

  def lights
    parsed = @bridge_state["lights"]
    parsed.to_a.map { |light_pair| Light.new(*light_pair, @groups)}
  end

  def groups
    parsed = @bridge_state["groups"]
    parsed.to_a.map { |group_pair| Group.new(*group_pair)}
  end

  def rules
    parsed = @bridge_state["rules"]
    parsed.to_a.map { |rule_pair| Rule.new(*rule_pair)}
  end

  def all_a  selector
    items =  sensors_a selector
    items +=  lights_a selector
    items +=  groups_a selector
    items += rules_a selector
  end

  def sensors_a selector
    sensors.map { |sensor| sensor.array(selector)}
  end

  def lights_a selector
    lights.map { |light| light.array(selector)}
  end

  def groups_a selector
    groups.map { |group| group.array(selector)}
  end

  def rules_a selector
    rules.map { |rule| rule.array(selector)}
  end
end
