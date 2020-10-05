require 'sequel';

class DatabaseConfig

	attr_reader :table;

	def initialize()
		db = Sequel.sqlite;
		db.create_table :fibonacci do
			primary_key :id
			String :contents 
		end
		@table = db[:fibonacci];
	end

end
