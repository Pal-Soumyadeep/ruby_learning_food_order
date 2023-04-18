class Taxes
  attr_reader :gst_rate, :service_tax_rate
  
  def initialize
    @gst_rate = 0.05 # 5% GST
    @service_tax_rate = 0.10 # 10% Service Charge
  end
end