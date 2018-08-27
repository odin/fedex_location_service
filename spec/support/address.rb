#class Address
#  attr_accessor :address_one, :address_two, :city, :state, :postal_code
#
#  def initialize(address_one, address_two, city, state, postal_code)
#    @address_one = address_one
#    @address_two = address_two
#    @city        = city
#    @state       = state
#    @postal_code = postal_code
#  end
#end

Address = Struct.new(:address_one, :address_two, :city, :state, :postal_code)
