			
class Object
  def is_number?
    to_f.to_s == to_s || to_i.to_s == to_s;
  end
end

class Input

	def self.checkArgs(array)
		result = true;

		if (array.length < 2) then
			puts "arguments missing" , " ";
			result = false;
		elsif (array.length > 2) then
			puts "wont recognize extra arguments"
			result = false;
		end

		if(array[0].is_number? || array[0] != '-n') then
			puts "wrong argument for first input";
			result = false;
		end

		if(array[1].to_i < 2) then
			puts "increase the required number";
			result = false;
		end	

		return result;
	end
end
