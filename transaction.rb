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