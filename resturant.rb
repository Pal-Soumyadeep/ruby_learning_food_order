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