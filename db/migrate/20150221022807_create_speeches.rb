class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.integer :scene_id, null: false
      t.integer :role_id, null: false

      t.timestamps
    end
  end
end
