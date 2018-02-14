class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.string :name,null: false, default: ""
      t.string :email,null: false, default: ""
      t.string :password,null: false, default: ""
      t.string :image,default: ""
      t.text :description,default: ""
      t.integer :rating,default: ""

      t.timestamps
    end
  end
end
