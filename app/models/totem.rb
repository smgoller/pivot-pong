class Totem < ActiveRecord::Base
  belongs_to :player
  belongs_to :loser, class_name: 'Player'
end