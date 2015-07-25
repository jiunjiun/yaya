class Flight < ActiveRecord::Base
  belongs_to :destination, class_name: :Destination
  belongs_to :other_route, class_name: :Destination
end
