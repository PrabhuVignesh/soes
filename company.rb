class Company
		
	def initialize(company_name,quantity)
		@company_name = company_name
		@quantity = quantity
		@after_sell = 0
		@after_buy = 0
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
	def status_buy
		@status_buy = @rem_buy > 0 ? "Open" : "Close"
	end
	def status_sell
		@status_sell = @rem_sell > 0 ? "Open" : "Close"
	end

	def buy(qty)
		if self.after_buy == nil or self.after_buy <=0
			@status_buy = 'Closed'
			@after_buy = qty
			if self.after_sell == 0 
				@rem_buy = 0
			else
				if self.after_buy > self.after_sell
					@rem_buy = @after_buy - @after_sell
				else
					@rem_buy = 0
				end
			end
			
		else
			@status_buy = 'Open'
			@after_buy = @after_buy + qty
			if self.after_buy > self.after_sell
				@rem_buy = @after_buy - @after_sell
			else
				@rem_buy = 0
			end 
		end
		#@after_buy = self.quantity + qty
		#self.update(self.company_name,@after_buy)
	end

	def sell(qty)
		if self.after_sell == nil or self.after_sell <=0
			@status_sell = 'Closed'
			@after_sell = qty
			if self.after_buy == 0
				@rem_sell = 0
			else
				if self.after_sell > self.after_buy
					@rem_sell = @after_sell - @after_buy
				else
					@rem_sell =0
				end 
			end
			
		else
			@status_sell = 'Open'
			@after_sell = @after_sell + qty
			if self.after_sell > self.after_buy
				@rem_sell = @after_sell - @after_buy
			else
				@rem_sell = 0
			end 
		end
	end
	def rem_buy
		@rem_buy
	end
	def rem_sell
		@rem_sell
	end
end

ABC = Company.new('ABC',0)
XYZ = Company.new('XYZ',0)


# ============ company ABC 1st iter ================
p "============ company #{ABC.company_name}  1st iter ================"

ABC.buy(10)
p ABC.rem_buy
p ABC.status_buy

# ============ company XYZ 2st iter ================
p "============ company #{ XYZ.company_name }2st iter ================"

XYZ.sell(15)
p XYZ.rem_sell
p XYZ.status_sell

# ============ company ABC 3st iter ================
p "============ company #{ABC.company_name}  2st iter ================"

ABC.sell(13)
p ABC.rem_sell
p ABC.status_sell

# ============ company XYZ 4st iter ================
p "============ company #{ XYZ.company_name} 2st iter ================"

XYZ.buy(10)
p XYZ.rem_buy
p XYZ.status_buy

# ============ company XYZ 5st iter ================
p "============ company #{XYZ.company_name}  2st iter ================"

XYZ.buy(8)
p XYZ.rem_buy
p XYZ.status_buy