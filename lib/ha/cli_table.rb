class CliTable
  attr_accessor :headers, :rows, :column_widths

  def add(headers, rows)
    @headers = headers
    @rows = rows
  end

  def rows_count
    @rows.length
  end


  def render
    result = header_render + "\n"
    @rows.each do
      |row|
      result << row_render(row) + "\n"
    end
    result
  end

  def header_render
    result = ""
    @headers.each_index { |i| result << (" %#{column_widths[i]}s" % headers[i]) }
    result
  end

  def row_render row
    result = ""
    @headers.each_index { |i| result << (" %#{column_widths[i]}s" % format_value(row[i])) }
    result
  end

  def reset
    @rows = []
  end

  private 

  def format_value(val)
    if [true, false].include? val
      val ? "Yes" : "No"
    elsif val.nil?
      val = "nil"
    end
    val
  end
end