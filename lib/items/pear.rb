require_relative '../item'

class Pear < Item
  def self.get_prices
    { 1 => 1.50, 2 => 2.25 }
  end
end
