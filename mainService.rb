
require_relative 'inputCheck';
require_relative 'fibonacciNumber';
require_relative 'multiplicationTable';
require_relative 'databaseConfig';
require_relative 'dbStringUtils';

class MainService

	@@table;

	def initialize()
		databaseConfig = DatabaseConfig.new;
		@@table = databaseConfig.table;
	end

	def obtainFibonacciTable(argv)
		if(Input.checkArgs(argv) == true) then
			number = argv[1].to_i;

			existingFibonacci = @@table.where(id: number);

			if(existingFibonacci.first.nil?) then

				fibArray = Fibonacci.generateFibonacci(number);
				map = MultiplicationTable.new;
				map.generateMultiplicationTableOf(fibArray, fibArray);
				stringRep = DBStringUtils.serializer(map.fibMap);
				@@table.insert(id: number, contents: stringRep);

				return DBStringUtils.deserializer(stringRep);
			else 
				return DBStringUtils.deserializer(existingFibonacci.first[:contents]);
			end

		end			
	end
end	