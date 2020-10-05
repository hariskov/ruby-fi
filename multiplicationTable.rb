require "matrix"

class MultiplicationTable

	attr_reader :fibMap;

	def generateMultiplicationTableOf(array1, array2)
		fibMap = Array.new(array1.length){Array.new(array2.length)};

		for i in 0..array1.length-1 do
			for j in 1..array2.length  do
				fibMap[i][j-1] = array1[i]*array2[j-1];
			end
			fibMap[i].insert(0,array1[i]);
		end

		array2.insert(0, nil);
		fibMap.insert(0,array2);

		@fibMap = fibMap;
	end

end