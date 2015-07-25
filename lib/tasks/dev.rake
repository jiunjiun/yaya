# encoding: utf-8
namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", :setup ]

  desc "Setup system data"
  task :setup => :environment do
    # Destination.new(iata: 'NRT', en: 'Tokyo', zh: '東京').save!
    # Destination.new(iata: 'AKL', en: 'Auckland', zh: '奧克蘭').save!
  end
end
