class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :height, :decimal, :precision => 4, :scale => 2
    add_column :users, :weight, :integer
    add_column :users, :lifestyle, :string
    add_column :users, :gender, :string
    add_column :users, :goal, :string
    add_column :users, :schedule, :text
    add_reference :users, :coach, foreign_key: true
  end
end
