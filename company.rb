class Company
	def initialize(company_name,quantity)
		@company_name = company_name
		@quantity = quantity
	end
	def update(company_name,quantity)
		@company_name = company_name
		@quantity = quantity
	end
	def company_name
		@company_name
	end 

	def quantity
		@quantity
	end

	def buy(qty)
		@after_buy = self.quantity + qty
		self.update(self.company_name,@after_buy)
	end

	def sell(qty)
		@after_sell =  self.quantity - qty
		self.update(self.company_name,@after_sell)
	end
	def status
		if @quantity > 0			
			@status = 'open'
		else
			@status = 'close'
		end
	end
end

ABC = Company.new('ABC',0)
XYZ = Company.new('XYZ',0)


# ============ company ABC 1st iter ================
p "============ company #{ABC.company_name}  1st iter ================"

ABC.buy(10)
p ABC.quantity
p ABC.status

# ============ company XYZ 2st iter ================
p "============ company #{ XYZ.company_name }2st iter ================"

ABC.sell(15)
p ABC.quantity
p ABC.status

# ============ company ABC 3st iter ================
p "============ company #{ABC.company_name}  2st iter ================"

ABC.sell(13)
p ABC.quantity
p ABC.status

# ============ company XYZ 4st iter ================
p "============ company #{ XYZ.company_name} 2st iter ================"

ABC.buy(10)
p ABC.quantity
p ABC.status

# ============ company XYZ 5st iter ================
p "============ company #{XYZ.company_name}  2st iter ================"

ABC.buy(8)
p ABC.quantity
p ABC.status