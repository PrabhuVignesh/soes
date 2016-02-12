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
	def after_buy
		@after_buy
	end

	def after_sell
		@after_sell
	end

	def buy(qty)
		if self.after_sell == 0
			@status_buy = 'close'
			
		else
			@after_buy = self.after_sell - qty
			@status_buy = 'open'
		end
	end

	def sell(qty)
		if self.after_buy == 0
			@status_sell = 'close'
		else
			@after_sell = self.after_buy - qty
			@status_sell = 'open'
		end
		@after_sell = self.after_sell != nil ? self.after_sell - self.after_buy : qty
		self.update(self.company_name,@after_buy)
	end
	
	def status_buy
		@status_buy
	end

	def status_sell			
		@status_sell
	end
end

ABC = Company.new('ABC',0)
XYZ = Company.new('XYZ',0)


# ============ company ABC 1st iter ================
<<<<<<< HEAD
p "============ company #{ABC.company_name} buy 10  1st iter ================"
=======
p "============ company #{ABC.company_name} buy(10) 1st iter ================"
>>>>>>> 5e643137ddf9f95167a5f3e954ed7bb735b3905f

ABC.buy(10)
p ABC.after_buy
p ABC.status_buy

# ============ company XYZ 2st iter ================
<<<<<<< HEAD
p "============ company #{ XYZ.company_name } sell 15 2st iter ================"

XYZ.sell(15)
p XYZ.after_sell
p XYZ.status_sell

# ============ company ABC 3st iter ================
p "============ company #{ABC.company_name} sell 13 3rd iter ================"
=======
p "============ company #{ XYZ.company_name } sell(15) 2st iter ================"

XYZ.sell(15)
p XYZ.quantity
p XYZ.status

# ============ company ABC 3st iter ================
p "============ company #{ABC.company_name} sell(13) 2st iter ================"
>>>>>>> 5e643137ddf9f95167a5f3e954ed7bb735b3905f

ABC.sell(13)
p ABC.after_sell
p ABC.status_sell

# ============ company XYZ 4st iter ================
<<<<<<< HEAD
p "============ company #{ XYZ.company_name} buy 10  2st iter ================"

XYZ.buy(10)
p XYZ.after_buy
p XYZ.status_buy

# ============ company XYZ 5st iter ================
p "============ company #{XYZ.company_name} buy 8 2st iter ================"

XYZ.buy(8)
p XYZ.after_buy
p XYZ.status_buy
=======
p "============ company #{ XYZ.company_name} buy(10) 2st iter ================"

XYZ.buy(10)
p XYZ.quantity
p XYZ.status

# ============ company XYZ 5st iter ================
p "============ company #{XYZ.company_name} buy(8) 2st iter ================"

XYZ.buy(8)
p XYZ.quantity
p XYZ.status
>>>>>>> 5e643137ddf9f95167a5f3e954ed7bb735b3905f
