class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    t.string :name, null: false
    t.integer :play_id, null: false

    t.timestamps
    end
  end
end
