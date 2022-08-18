class City

	def initialize
		@cities = {
			'Tokio': 15000000,
			'New York': 22000000,
			'Sao Paulo': 10000000,
			'Mexico City': 12000000
		}
	end

	def sum_pop
		sum = 0
		@cities.map{ |c| sum += c[1] }
		return sum
	end

	def average_pop
		return self.sum_pop/(@cities.size)
	end

	begin
		puts City.new.send(ARGV[0])
	rescue Exception => e
		raise 'Invalid operation'
	end	
end