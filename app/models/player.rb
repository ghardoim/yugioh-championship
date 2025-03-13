class Player < ApplicationRecord
    validates :name, length: { minimum: 5 }

    has_many :matches_as_player_1, class_name: 'Match', foreign_key: 'player_1_id'
    has_many :matches_as_player_2, class_name: 'Match', foreign_key: 'player_2_id'
end
