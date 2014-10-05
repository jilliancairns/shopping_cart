require_relative '../item'

class Pear < Item
  def self.get_costs
    { 1 => 1.50, 2 => 2.25 }
  end
end
