class Card < ActiveRecord::Base
	belongs_to :deck

	def check_guess(guess)
		self.answer.downcase == guess.downcase
	end
end
