class MatrixOperations


	def initialize
		@m = [
			[0, 1, 2],
			[3, 1, 2],
			[4, 3, 6]
		]
	end

	def count_itens
		itens = {}
		@m.each do |l|
			l.each do |i|
				count = itens[i] ? itens[i] += 1 : 1
				itens[i]=count
			end
		end
		return itens
	end

	MatrixOperations.new.count_itens.each{ |i| puts "#{i[0]} => #{i[1]}"}
end