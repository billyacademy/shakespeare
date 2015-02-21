class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :title, null: false
      t.integer :act_id, null: false

      t.timestamps
    end
  end
end
