class Restaurant
  attr_accessor :id, :name, :address, :menu, :owner
  
  def initialize(id, name, address, menu, owner)
    @id = id
    @name = name
    @address = address
    @menu = menu
    @owner = owner
  end
  
  def display_menu
    puts "Menu for #{@name}:"
    @menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]} - Rs.#{item[:price]}"
    end
  end

  def display_owner
    puts "Owner for #{@name}:"
    @owner.each do |person|
      puts "#{person.name}"
    end
  end
end