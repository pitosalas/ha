require_relative 'test_helper'

class HueTest < Minitest::Test

  describe "Test Sensor class" do
    before do
      @key = "1"
      @hash = {"state"=>{"daylight"=>true, "lastupdated"=>"2018-10-19T11:02:00"}, "config"=>{"on"=>true, "configured"=>true, "sunriseoffset"=>0, "sunsetoffset"=>0}, "name"=>"Daylight", "type"=>"Daylight", "modelid"=>"PHDL00", "manufacturername"=>"Philips", "swversion"=>"1.0"}
    end

    it "can return the name property" do
      sens = Sensor.new(@key, @hash)
      sens.get_array(["name"]).first.must_equal "Daylight"
    end
    
    it "can return the name property" do
      sens = Sensor.new(@key, @hash)
      sens.get_array(["on"]).first.must_equal true
    end

  end
end
