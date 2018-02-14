class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :coach
  
  after_create :generate_access_token

  def generate_access_token
    generated = SecureRandom.hex
    until User.where(access_token: generated).first.nil?
      generated = SecureRandom.hex
    end
    self.access_token = generated
    save!
  end

end
