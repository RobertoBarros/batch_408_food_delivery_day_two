require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--require ./bonus_formatter.rb --format BonusFormatter"
end

desc "Look for style guide offenses in your code"
task :rubocop do
  # sh "rubocop --format simple || true"
end

desc "Launch tests for the meal namespace only"
task :int_meal do
  sh "rspec -t meal"
end

desc "Launch tests for the customer namespace only"
task :int_customer do
  sh "rspec -t customer"
end

desc "Launch tests for the employee namespace only"
task :int_employee do
  sh "rspec -t employee"
end

desc "Launch tests for the order namespace only"
task :int_order do
  sh "rspec -t _order"
end

task default: [:rubocop, :spec]

task meal: [:rubocop, :int_meal]

task customer: [:rubocop, :int_customer]

task employee: [:rubocop, :int_employee]

task order: [:rubocop, :int_order]
