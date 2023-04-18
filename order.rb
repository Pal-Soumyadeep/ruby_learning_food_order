class Order
  attr_accessor :user, :restaurant, :items
 
  def initialize(user, restaurant)
    @user = user
    @restaurant = restaurant
    @items = []
  end
  
  def add_item(item, quantity)
    @items << { item: item, quantity: quantity }
  end
  
  def display_order
    puts "Order details:"
    puts "User: #{@user.name}"
    puts "Restaurant: #{@restaurant.name}"
    puts "Items: "
    total_cost = 0
    @items.each do |item|
      cost = item[:item].price * item[:quantity]
      puts "#{item[:item].name} - Rs.#{item[:item].price} x #{item[:quantity]} = Rs.#{cost}"
      total_cost += cost
    end
    puts "Total Cost: Rs.#{total_cost}"
  end
  
  def calculate_subtotal
    subtotal = 0
    items.each do |order_item|
      subtotal += order_item[:item].price * order_item[:quantity]
    end
    subtotal
  end
end