require_relative 'test_helper'

class RuleTest < Minitest::Test

  describe "Test Rule class" do
    before do
      @key = "1"
      rawhash = JSON.parse(File.read("test/fixtures/state3.json"))
      rules = rawhash["rules"]
      @id = rules.first[0]
      @hash = rules.first[1]
    end

    it "can return the name property" do
      rule = Rule.new(@key, @hash)
      rule.get_array(["name"]).first.must_equal "RpsIphone"
    end

    it "can return the On property" do
      rule = Rule.new(@key, @hash)
      rule.get_array(["on"]).first.must_equal true
    end
  end
end
