require 'json'
require 'faraday'

BRIDGE_IP = "10.0.0.89"
USERNAME = "3ClrGgbS5Nm9x2tc3Kbr7DxkaFvvqmewswPT5xzI"


class Hue
  attr_accessor :context

  def initialize(context)
    @c = context
  end

  def pair
    @c[:useraccount] = "12345"
    @c.save
  end

  def list
    res = []
    get_sensors
  end

  def list_headers
    ["Name", "State", "Time"]
  end

  def get_sensors
    sensors = JSON.parse(Faraday.get("http://10.0.0.89/api/3ClrGgbS5Nm9x2tc3Kbr7DxkaFvvqmewswPT5xzI/sensors").body)
  end
end
