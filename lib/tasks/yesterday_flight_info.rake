# encoding: utf-8
namespace :flight do
  desc "save yesterday flight info"
  task :yesterday => :environment do
    FlightInfo.save_yesterday_info
  end
end
