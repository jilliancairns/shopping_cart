require_relative '../item'

class Orange < Item
  def self.get_costs
    { 1 => 0.35, 4 => 1.00 }
  end
end
