class Hue
  attr_accessor :context

  def initialize(context)
    @c = context
  end

  def pair
    @c[:useraccount] = "12345"
    @c.save
  end

  def list
    res = []
    res << ["Light 1", "Bright", "11:03"]
    res << ["Light 1", "Bright", "11:03"]
    res << ["Light 1", "Bright", "11:03"]
    res
  end

  def list_headers
    ["Name", "State", "Time"]
  end
end
