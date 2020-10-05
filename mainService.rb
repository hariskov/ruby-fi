
require_relative 'inputCheck';
require_relative 'fibonacciNumber';
require_relative 'multiplicationTable';
require_relative 'databaseConfig';
require_relative 'dbStringUtils';
require_relative 'resultingTable';
class MainService

	@@table;

	def initialize()
		databaseConfig = DatabaseConfig.new;
		@@table = databaseConfig.table;
	end

	def obtainFibonacciTable(argv)
		if(Input.checkArgs(argv) == true) then
			number = argv[1].to_i;

			resultingTable = ResultingTable.new;

			existingFibonacci = @@table.where(id: number);
			resultingTable.saved = existingFibonacci.first.nil?;

			if(resultingTable.saved) then

				fibArray = Fibonacci.generateFibonacci(number);
				map = MultiplicationTable.new;
				map.generateMultiplicationTableOf(fibArray, fibArray);
				stringRep = DBStringUtils.serializer(map.fibMap);
				@@table.insert(id: number, contents: stringRep);

				resultingTable.table = DBStringUtils.deserializer(stringRep);
			else 
				resultingTable.table = DBStringUtils.deserializer(existingFibonacci.first[:contents]);
			end

			return resultingTable;

		end			
	end
end	