class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :user_id

      t.timestamps
    end
  end
end
