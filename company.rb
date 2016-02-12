class Company
	def initialize(company_name,quantity)
    	@company_name = company_name
    	@quantity = quantity
  	end
	  def company_name
	    @company_name
	  end 
	  def quantity
	    @quantity
	  end
end
module Buy
   def buy
     puts 'buy buy buy buy'
   end
end
module Sell
   def sell
     puts 'sell sell sell sell'
   end
end
class Action
   include Buy
   include Sell
end
xyz = Company.new('Pablo',10)
puts xyz.company_name

ppp = Action.new
ppp.buy
ppp.sell