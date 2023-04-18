class Address
  attr_accessor :street, :city, :state, :pincode
  
  def initialize(street, city, state, pincode)
    @street = street
    @city = city
    @state = state
    @pincode = pincode
  end
end