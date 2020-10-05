
class DBStringUtils

	DELIMETER = ";";

	def self.serializer(object)
		return object.map(&:inspect).join(DELIMETER);
	end

	def self.deserializer(object)
		return object.split(DELIMETER);
	end

end