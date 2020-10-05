require_relative 'mainService';

service = MainService.new;
table = service.obtainFibonacciTable(ARGV);

