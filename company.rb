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
xyz = Company.new('Pablo',10)
puts xyz.company_name