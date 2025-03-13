class Match < ApplicationRecord
  validates :player_1, presence: true
  validates :player_2, presence: true

  belongs_to :player_1, class_name: 'Player'
  belongs_to :player_2, class_name: 'Player'
end