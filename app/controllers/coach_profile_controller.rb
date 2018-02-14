class CoachProfileController < ApplicationController
  before_action :authenticate_trainer 

  def profile
  end
end
