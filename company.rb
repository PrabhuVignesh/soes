require 'csv'
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
		if self.after_buy == nil or self.after_buy <= 0
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
					@rem_sell = 0
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

output = []
customers = CSV.read('SOES - Input.csv') # Mention your test file path here
	opx = []
	customers.each_with_index do |one,i|
		if i!= 0 
		 opx << one[2]
		end
	end
	opx = opx.uniq

		items = []
		opx.each do |val|
		  items << Company.new(val,0)

		end
customers.each_with_index do |one,i|
	op = []
	pix = ''
	oux = ''
	if i == 0
		one.each do |two|
			op << two
		end
		output << op
	else
		slno = one[0]
		side = one[1]
		cmpny = one[2]
		qty = one[3]
		op << slno
		op << side 
		op << cmpny
		if side == 'Buy'
			items[opx.index(cmpny)].buy(qty.to_i)
			pix += (items[opx.index(cmpny)].rem_buy).to_s
			oux += (items[opx.index(cmpny)].status_buy).to_s
		elsif 
			items[opx.index(cmpny)].sell(qty.to_i)
			pix += (items[opx.index(cmpny)].rem_sell).to_s
			oux += (items[opx.index(cmpny)].status_sell).to_s
		end
		#items[opx.index(cmpny)].status_buy
		 op << "(#{qty},#{pix},#{oux})"
		output << op
	end
	
end

output.each do |qq|
	p qq.join(' , ')  # output print
end