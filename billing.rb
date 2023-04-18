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