class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
