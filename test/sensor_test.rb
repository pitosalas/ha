require_relative 'test_helper'

class HueTest < Minitest::Test

  describe "Test Sensor class" do
    it "can be constructred" do
      sens = Sensor.new
    end

    it "returns all devices in a single array" do
      # state_h = Hue.get_bridge_state
      # hue = Hue.new(::Context.new, state_h)
      # res = hue.get_all_a ["name", "type", "on"]
      # res.length.must_be :>, 0
    end
  end
end
