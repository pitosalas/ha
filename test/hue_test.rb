require_relative 'test_helper'

class HueTest < Minitest::Test

  describe "able to get state of philips hue bridge" do
    it "returns a valid hash" do
      state_h = Hue.get_bridge_state
      state_h.must_be_instance_of Hash
    end

    it "returns all devices in a single array" do
      state_h = Hue.get_bridge_state
      hue = Hue.new(::Context.new, state_h)
      res = hue.get_all_a ["name", "type", "on"]
      res.length.must_be :>, 0
    end
  end
end
