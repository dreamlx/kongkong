require 'rake'

task :name,:first_name, :last_name =>:environment do |t, args|
	puts "First name is #{args.first_name}"
	puts "Last  name is #{args.last_name}"
end