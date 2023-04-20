class Transaction
  attr_reader :transaction_id, :transaction_status, :trans_method
  def initialize
    @transaction_id = generate_transaction_id
    @transaction_status = transaction_status
  end
  
  protected
  
  def do_transact
    puts "pay by\n1. Cash\n2. Card\n3. UPI"
    print "Pay by: "
    trans_method = gets.chomp.to_i
    if trans_method == 1 || trans_method == 2 || trans_method == 3
      @transaction_status = "Paid"
    else
      @transaction_status = "Pending"
    end
  end

  private
  
  def generate_transaction_id
    # Logic to generate transaction id is using random function for now
    rand(100000..999999)
  end
end