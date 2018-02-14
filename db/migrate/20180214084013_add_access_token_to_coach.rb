class AddAccessTokenToCoach < ActiveRecord::Migration[5.0]
  def change
    add_column :coaches, :access_token, :string
  end
end
