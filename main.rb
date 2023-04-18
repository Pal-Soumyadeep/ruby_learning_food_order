#Loading the files containing different classes and methods
require './address.rb'
require './billing.rb'
require './employees.rb'
require './item.rb'
require './order.rb'
require './resturant.rb'
require './taxes.rb'
require './transaction.rb'
require './user.rb'


# Create Menu
menu1 = [
  { 
    name: "Burger", 
    price: 100 
  }, 
  { 
    name: "Pizza", 
    price: 200 
  }, 
  { 
    name: "Fries", 
    price: 50 
  }
]
menu2 = [
  { 
    name: "Sushi", 
    price: 150 
  }, 
  { 
    name: "Ramen", 
    price: 250 
  }, 
  { 
    name: "Tempura", 
    price: 100 
  }
]
menu3 = [
  {
    name: "Chicken Biryani",
    price: 150
  },
  {
    name: "Mutton Biryani",
    price: 200
  },
  {
    name: "Veg Biryani",
    price: 100
  }
]
menu4= [
  {
    name: "Chocolate Ice Cream",
    price: 20
  },
  {
    name: "Vanilla Ice Cream",
    price: 10
  },
  {
    name: "Strawberry Ice Cream",
    price: 15
  }
]
menu5 = [
  { 
    name: "Dosa", 
    price: 100 
  }, 
  { 
    name: "Uttapam", 
    price: 100 
  }, 
  { 
    name: "Idli", 
    price: 50 
  }
]
menu6 = [
  { 
    name: "Chilli Chicken", 
    price: 150 
  }, 
  { 
    name: "Hakka Noodles", 
    price: 250 
  }, 
  { 
    name: "Manchurian", 
    price: 100 
  }
]
menu7 = [
  {
    name: "Roti",
    price: 15
  },
  {
    name: "Rice",
    price: 200
  },
  {
    name: "Gravy",
    price: 100
  }
]

rest_name = ["Fast Food Corner", "Japanese Delights", "Biryani Place", "Ice Parlour", "Southern Delight", "Chinese Corner", "Northen Tadka"]
cities = ["New Delhi", "Noida", "Gurgaon", "Ghaziabad", "Faridabad"]
states = ["Delhi", "Uttar Pradesh", "Haryana"]

#Create different address objects
address1 = Address.new("123 Main St", cities[0], states[0], "10001")
address2 = Address.new("456 Oak St", cities[1], states[1], "90001")
address3 = Address.new("371 Cross St", cities[2], states[2], "874921")
address4 = Address.new("726 No St", cities[3], states[1], "263822")
address5 = Address.new("748 Yes St", cities[4], states[2], "736782")

#Create different resturant object
restaurant1 = Restaurant.new(rest_name[0], address1, menu1)
restaurant2 = Restaurant.new(rest_name[1], address2, menu2)
restaurant3 = Restaurant.new(rest_name[2], address3, menu3)
restaurant4 = Restaurant.new(rest_name[3], address4, menu4)
restaurant5 = Restaurant.new(rest_name[4], address5, menu5)
restaurant6 = Restaurant.new(rest_name[5], address2, menu6)
restaurant7 = Restaurant.new(rest_name[6], address3, menu7+menu3)

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
puts "2. #{restaurant2.name} - #{restaurant2.address.street}, #{restaurant2.address.city}, #{restaurant2.address.state}, #{restaurant2.address.pincode}"
puts "3. #{restaurant3.name} - #{restaurant3.address.street}, #{restaurant3.address.city}, #{restaurant3.address.state}, #{restaurant3.address.pincode}"
puts "4. #{restaurant4.name} - #{restaurant4.address.street}, #{restaurant4.address.city}, #{restaurant4.address.state}, #{restaurant4.address.pincode}"
puts "5. #{restaurant5.name} - #{restaurant5.address.street}, #{restaurant5.address.city}, #{restaurant5.address.state}, #{restaurant5.address.pincode}"
puts "6. #{restaurant6.name} - #{restaurant6.address.street}, #{restaurant6.address.city}, #{restaurant6.address.state}, #{restaurant6.address.pincode}"
puts "7. #{restaurant7.name} - #{restaurant7.address.street}, #{restaurant7.address.city}, #{restaurant7.address.state}, #{restaurant7.address.pincode}"

# Prompt user to select a restaurant
print "Enter the restaurant number to place an order: "
restaurant_choice = gets.chomp.to_i
  
if restaurant_choice == 1
  selected_restaurant = restaurant1
elsif restaurant_choice == 2
  selected_restaurant = restaurant2
elsif restaurant_choice == 3
  selected_restaurant = restaurant3
elsif restaurant_choice == 4
  selected_restaurant = restaurant4
elsif restaurant_choice == 5
  selected_restaurant = restaurant5
elsif restaurant_choice == 6
  selected_restaurant = restaurant6
elsif restaurant_choice == 7
  selected_restaurant = restaurant7
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