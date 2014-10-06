require 'rspec'
require_relative '../lib/cart'

describe Cart do
  def add_items(item, number)
    number.times do
      @cart.add(item)
    end
  end

  before :each do
    @cart = Cart.new
  end

  context "single items" do
    specify "#apple" do
      @cart.add(Apple)
      expect(@cart.total).to eq(0.99)
    end

    specify "#pear" do
      @cart.add(Pear)
      expect(@cart.total).to eq(1.50)
    end

    specify "#orange" do
      @cart.add(Orange)
      expect(@cart.total).to eq(0.35)
    end
  end

  context "apple deals" do
    specify "#two" do
      add_items(Apple, 2)
      expect(@cart.total).to eq(1.50)
    end

    specify "#two twice" do
      add_items(Apple, 4)
      expect(@cart.total).to eq(3.00)
    end

    specify "#ten" do
      add_items(Apple, 10)
      expect(@cart.total).to eq(4.25)
    end

    specify "#ten twice" do
      add_items(Apple, 20)
      expect(@cart.total).to eq(8.50)
    end

    specify "#both" do
      add_items(Apple, 12)
      expect(@cart.total).to eq(5.75)
    end

    specify "#both plus one" do
      add_items(Apple, 13)
      expect(@cart.total).to eq(6.74)
    end
  end

  context "pear deals" do
    specify "#bogo half off" do
      add_items(Pear, 2)
      expect(@cart.total).to eq(2.25)
    end

    specify "#bogo half off plus one" do
      add_items(Pear, 3)
      expect(@cart.total).to eq(3.75)
    end

    specify "#bogo half off, twice" do
      add_items(Pear, 4)
      expect(@cart.total).to eq(4.50)
    end
  end

  context "orange deals" do
    specify "#four" do
      add_items(Orange, 4)
      expect(@cart.total).to eq(1.00)
    end

    specify "#four twice" do
      add_items(Orange, 8)
      expect(@cart.total).to eq(2.00)
    end

    specify "#four plus one" do
      add_items(Orange, 5)
      expect(@cart.total).to eq(1.35)
    end
  end

  context "mixed carts" do
    specify "#apples and pears" do
      @cart.add(Apple)
      @cart.add(Pear)
      @cart.add(Apple)

      # two for 1.50 on apples plus one pear
      expected_total = 1.50 + 1.50
      expect(@cart.total).to eq(expected_total)
    end

    specify "#apples and oranges" do
      @cart.add(Orange)
      @cart.add(Apple)
      @cart.add(Orange)
      @cart.add(Orange)
      @cart.add(Orange)

      # four for 1.00 on oranges plus one apple
      expected_total = 1.00 + 0.99
      expect(@cart.total).to eq(expected_total)
    end

    specify "#pears and oranges" do
      @cart.add(Pear)
      @cart.add(Pear)
      @cart.add(Orange)
      @cart.add(Pear)

      # buy one get one half off on pears, plus one pear and one orange
      expected_total = 1.50 + 0.75 + 0.35 + 1.50
      expect(@cart.total).to eq(expected_total)
    end

    specify "#all three" do
      @cart.add(Apple)
      @cart.add(Apple)
      @cart.add(Pear)
      @cart.add(Pear)
      @cart.add(Orange)
      @cart.add(Orange)
      @cart.add(Orange)
      @cart.add(Orange)

      # two for 1.50 on apples, bogo half off on pears, four for 1.00 on oranges
      expected_total = 1.50 + 1.50 + 0.75 + 1.00
      expect(@cart.total).to eq(expected_total)
    end
  end

  context "bad item" do
    specify { expect { @cart.add(:apple) }.to raise_error }

    specify do
      class Pineapple; end
      expect { @cart.add(Pineapple) }.to raise_error
    end
  end
end
