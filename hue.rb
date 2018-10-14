class Hue < Thor
  desc "list", "list Hue items"
  def list
    puts "listing hue"
  end

  desc "pair", "run pairing process to allow you to access the hue bridge"
  def pair
    puts "Pairing... Run over to the bridge, and press the button"
  end
end
  

