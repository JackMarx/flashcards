class Round < ActiveRecord::Base
	belongs_to :user
	belongs_to :deck
  has_many :cards, through: :deck
end
