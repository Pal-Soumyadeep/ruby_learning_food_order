require './user.rb'

class Admin < User
  attr_accessor :name

  def initialize(name)
    super(name)
  end

  def add_menu_item(restaurant, name, price)
    restaurant.menu << {name: name, price: price}
  end
end