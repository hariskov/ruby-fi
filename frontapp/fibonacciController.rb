require 'sinatra/base'
require_relative '../mainService';

class FibonacciController  < Sinatra::Base	

	@mainService;

	def initialize()
		super();
		@mainService = MainService.new;
	end

	set :run, Proc.new {$0 == app_file}

	get '/fibonacci' do
		# number = params['n'];
		# args = ['-n',number];
		# resultingTable = @mainService.obtainFibonacciTable(args);

		erb :fibonacci, locals: {size: params[:n], table: nil, saved: false}, layout: :application
	end


	post '/fibonacci' do
		number = params['n'];
		args = ['-n',number];
		resultingTable = @mainService.obtainFibonacciTable(args);
		erb :fibonacci, locals: {size: params[:n], table: table, saved: saved}, layout: :application
	end

	run!;
end
  
