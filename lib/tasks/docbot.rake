desc "Add boilerplate documentation to your Ruby files"
task :docbot_scribble => :environment do
  require 'docbot/docbot'
  options={}
  options[:rails_app] = ENV['rails_app']
  DocbotRunner.scribble(options)
end

desc "Remove schema information from model and fixture files"
task :docbot_erase => :environment do
  require 'docbot/docbot'
  options={}
  options[:rails_app] = ENV['rails_app']
  DocbotRunner.erase(options)
end