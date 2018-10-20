class CliTable
  attr_accessor :headers, :rows

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
    @headers.each { |h| result << (" %10s" % h)  }
    result
  end

  def row_render row
    result = ""
    row.each { |c| result << (" %10s" % format_value(c)) }
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