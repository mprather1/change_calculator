class ChangeCalculator

  attr_accessor :total, :cash, :change, :change_tend, :bills

  def initialize
    @total = total
    @cash = cash
    @change_tend = change_tend
    @bills = Hash.new
    @change = Hash.new
  end

  def get_input
    puts "Enter total cost: "
    @total = gets.to_f
    puts "Enter amount of cash: "
    @cash = gets.to_f
  end

  def get_change
    change_subtotal = @cash.to_f - @total
    @change_tend = change_subtotal
    @bills = Hash[:twenties, (change_subtotal/20).to_i, :tens, ((change_subtotal % 20) / 10).to_i, :fives, (((change_subtotal % 20)%10)/5).to_i, :ones, (((change_subtotal%20)%10)%5).to_i]
    coin_subtotal = change_subtotal - change_subtotal.to_i
    @change = Hash[:quarters, (coin_subtotal.round(2)/0.25).to_i, :dimes, ((coin_subtotal.round(2)%0.25)/0.10).to_i, :nickels, (((coin_subtotal.round(2)%0.25)%0.1)/0.05).to_i, :pennies, ((((coin_subtotal.round(2)%0.25)%0.10)%0.05)/0.01).to_i]
  end

  def show_change
    puts "\n$#{@change_tend.round(2)} in change."
    puts @bills
    puts @change
  end

end

calc = ChangeCalculator.new
calc.get_input
calc.get_change
calc.show_change
