class Restaurant
  attr_accessor :id, :name, :address, :menu
  
  def initialize(id, name, address, menu)
    @id = id
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