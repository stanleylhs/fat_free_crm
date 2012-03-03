if defined?(RSpec)
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new

  namespace :spec do
    desc "Preparing test env"
    task :prepare do
      Rails.env = "test"
      Rake::Task["config:copy_database_yml"].invoke
    end
  end

  Rake::Task["spec"].prerequisites.clear
  Rake::Task["spec"].prerequisites.push("spec:prepare")

  desc 'Run the acceptance specs in ./acceptance'
  RSpec::Core::RakeTask.new(:acceptance => 'db:test:prepare') do |t|
    t.pattern = 'acceptance/**/*_spec.rb'
  end  
end