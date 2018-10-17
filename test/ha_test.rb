require 'test_helper'
class HaTest < Minitest::Test
  describe "has a version number" do
    ::Ha::VERSION.wont_be_nil
  end

  describe "it does something useful" do
    assert false
  end
end
