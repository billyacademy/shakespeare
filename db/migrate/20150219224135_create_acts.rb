class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :title, null: false
      t.integer :play_id, null: false

      t.timestamps
    end
  end
end
