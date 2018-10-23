require_relative 'test_helper'
require 'ha/cli_table'

class CliTableTest < Minitest::Test
  describe "has core functionality" do
    before do
      @t1 = CliTable.new
      @t2 = CliTable.new
      @t2.add(["a", "b", "c"], [["1", "2", "3"],["X", "Y", "Z"]])
    end
    it "Can accept data" do
      @t1.add(["a", "b", "c"], [["1", "2", "3"],["X", "Y", "Z"]])
      @t1.rows_count.must_equal 2
    end

    it "Can be reset" do
      @t2.reset
      @t2.rows_count.must_equal 0
    end

    it "can update headers" do
      @t2.headers = ["Boo", "Foo"]
      @t2.headers.include?("Boo").must_equal true
    end

    it "generate a simple table" do
      @t2.column_widths = [20, 10, 10]
      res = @t2.render
      res.include?("a").must_equal true
    end
  end
end
