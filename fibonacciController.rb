require 'sinatra/base'
require_relative 'mainService';

class FibonacciController  < Sinatra::Base	

	@mainService;

	def initialize()
		super();
		@mainService = MainService.new;
	end

	set :run, Proc.new {$0 == app_file}

	get '/fibonacci' do
		number = params['n'];
		args = ['-n',number];
		return @mainService.obtainFibonacciTable(args);
	end

	run!;
end
  
