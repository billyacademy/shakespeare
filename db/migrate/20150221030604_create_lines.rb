class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :message, null: false
      t.integer :speech_id, null: false

      t.timestamps
    end
  end
end
