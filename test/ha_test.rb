require 'test_helper'

class HaTest < Minitest::Test
  describe "has a version number" do
    it { wont_be_nil Ha::VERSION }
  end

  describe "it does something useful" do
    it { 1.must_be_same_as 1 }
  end
end
