class Address
  attr_accessor :street, :city, :state, :pincode
  
  def initialize(street, city, state, pincode)
    @street = street
    @city = city
    @state = state
    @pincode = pincode
  end
end
  
class Taxes
  attr_reader :gst_rate, :service_tax_rate
  
  def initialize
    @gst_rate = 0.18 # 18% GST
    @service_tax_rate = 0.10 # 10% Service Tax
  end
end
  
class Employees
  attr_accessor :name, :designation
  
  def initialize(name, designation)
    @name = name
    @designation = designation
  end
end
  
class Transaction
  attr_reader :transaction_id
  
  def initialize
    @transaction_id = generate_transaction_id
  end
  
  private
  
  def generate_transaction_id
    # Logic to generate transaction id is using random function for now
    rand(100000..999999)
  end
end
  
class Billing
  attr_reader :order, :taxes, :transaction
  
  def initialize(order, taxes, transaction)
    @order = order
    @taxes = taxes
    @transaction = transaction
  end
  
  def generate_bill
    puts "\nOrder Summary:"
    puts "---------------------------"
    order.display_order
    puts "---------------------------"
  
    subtotal = order.calculate_subtotal
    gst = calculate_tax(subtotal, taxes.gst_rate)
    service_tax = calculate_tax(subtotal, taxes.service_tax_rate)
    total = subtotal + gst + service_tax
  
    puts "Subtotal: INR #{subtotal.round(2)}"
    puts "GST (#{(taxes.gst_rate * 100).round(2)}%): INR #{gst.round(2)}"
    puts "Service Tax (#{(taxes.service_tax_rate * 100).round(2)}%): INR #{service_tax.round(2)}"
    puts "---------------------------"
    puts "Total: INR #{total.round(2)}"
    puts "Transaction ID: #{transaction.transaction_id}"
    puts "Payment Status: Pending" # You can update this based on actual payment status
  end
  
  private
  
  def calculate_tax(amount, rate)
    amount * rate
  end
end
  
class Restaurant
  attr_accessor :name, :address, :menu
  
  def initialize(name, address, menu)
    @name = name
    @address = address
    @menu = menu
  end
  
  def display_menu
    puts "Menu for #{@name}:"
    @menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]} - Rs.#{item[:price]}"
    end
  end
end
  
class User
  attr_accessor :name, :address
 
  def initialize(name, address)
    @name = name
    @address = address
  end
end
  
class Item
  attr_accessor :name, :price
  
  def initialize(name, price)
    @name = name
    @price = price
  end
end
  
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
  
# Create restaurant objects
menu1 = [{ name: "Burger", price: 100 }, { name: "Pizza", price: 200 }, { name: "Fries", price: 50 }]
menu2 = [{ name: "Sushi", price: 150 }, { name: "Ramen", price: 250 }, { name: "Tempura", price: 100 }]
address1 = Address.new("123 Main St", "New York", "NY", "10001")
address2 = Address.new("456 Oak St", "Los Angeles", "CA", "90001")
restaurant1 = Restaurant.new("Fast Food Corner", address1, menu1)
restaurant2 = Restaurant.new("Japanese Delights", address2, menu2)
  
# Create user object
print "Enter your name: "
user_name = gets.chomp
print "Enter your street address: "
user_street = gets.chomp
print "Enter your city: "
user_city = gets.chomp
print "Enter your state: "
user_state = gets.chomp
print "Enter your pincode: "
user_pincode = gets.chomp
user_address = Address.new(user_street, user_city, user_state, user_pincode)
user = User.new(user_name, user_address)
  
# Display available restaurants
puts "Available restaurants:"
puts "1. #{restaurant1.name} - #{restaurant1.address.street}, #{restaurant1.address.city}, #{restaurant1.address.state}, #{restaurant1.address.pincode}"
puts "2. #{restaurant2.name} - #{restaurant2.address.street},#{restaurant2.address.city}, #{restaurant2.address.state}, #{restaurant2.address.pincode}"
  
# Prompt user to select a restaurant
print "Enter the restaurant number to place an order: "
restaurant_choice = gets.chomp.to_i
  
if restaurant_choice == 1
  selected_restaurant = restaurant1
elsif restaurant_choice == 2
  selected_restaurant = restaurant2
else
  puts "Invalid choice. Exiting..."
  exit
end
  
# Display menu of selected restaurant
selected_restaurant.display_menu

# Prompt user to select items and quantity
order = Order.new(user, selected_restaurant)
loop do
  print "Enter the item number to add to order (or 0 to finish): "
  item_choice = gets.chomp.to_i
  break if item_choice == 0
  
  if item_choice < 1 || item_choice > selected_restaurant.menu.length
    puts "Invalid choice. Please try again."
    next
  end
  
  print "Enter the quantity: "
  quantity = gets.chomp.to_i
  
  if quantity <= 0
    puts "Quantity must be greater than 0. Please try again."
    next
  end
  
  selected_item = selected_restaurant.menu[item_choice - 1]
  order.add_item(Item.new(selected_item[:name], selected_item[:price]), quantity)
end
  
# Display order details
order.display_order
  
# Calculate and display bill details
taxes = Taxes.new
transaction = Transaction.new
bill = Billing.new(order, taxes, transaction)
bill.generate_bill 