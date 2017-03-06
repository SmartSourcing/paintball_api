require 'factory_girl'
require 'faker'
FactoryGirl.find_definitions

namespace :db do
  namespace :seed do

    desc "Create players data"
    task :players=> :environment do
      players = FactoryGirl.create_list(:player, 500)

      players.each do |player|

        player.gears << Gear.markers.sample
      end
    end

    desc "Create cube data"
    task :cube=> :environment do

        ActiveRecord::Base.connection.exec_query %Q{select generate_players_data();}
    end
  end
end
