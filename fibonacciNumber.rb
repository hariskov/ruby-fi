class Fibonacci
	
	def self.generateFibonacci(number) 
		index = 0;
		numbers = Array.new << 0 << 1;

		while(numbers.length <= number)
			numbers.push(numbers[index].to_i + numbers.last.to_i);
			index +=1;
		end
		return numbers;
	end
end