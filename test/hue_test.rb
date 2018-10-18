require 'test_helper'

class HueTest < Minitest::Test
  describe "able to get state of philis hue bridge" do
    it "returns a valid block of JSON" do
      json = Hue.get_bridge_state
      json.wont_be_nil
    end
  end

end
