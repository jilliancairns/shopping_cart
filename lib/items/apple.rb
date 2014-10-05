require_relative '../item'

class Apple < Item
  def self.get_costs
    { 1 => 0.99, 2 => 1.50, 10 => 4.25 }
  end
end
