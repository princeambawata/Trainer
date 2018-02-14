class Coach < ApplicationRecord
	has_many :users
    
    after_create :generate_access_token
    
	def generate_access_token
    generated = SecureRandom.hex
    until Coach.where(access_token: generated).first.nil?
      generated = SecureRandom.hex
    end
    self.access_token = generated
    save!
  end
end
