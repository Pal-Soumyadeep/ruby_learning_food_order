require './user.rb'

class Admin < User
  attr_accessor :name

  def initialize(name)
    super(name)
  end
end