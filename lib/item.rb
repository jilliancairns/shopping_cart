class Item
  def self.get_costs
    {}
  end

  def self.compute_total(n)
    remaining = n
    total = 0

    costs = self.get_costs
    costs_descending = costs.keys.sort.reverse

    costs_descending.each do |num_purchased|
      while remaining >= num_purchased
        total += costs[num_purchased]
        remaining -= num_purchased
      end
    end

    total
  end
end
