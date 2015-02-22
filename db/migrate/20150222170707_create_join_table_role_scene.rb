class CreateJoinTableRoleScene < ActiveRecord::Migration
  def change
    create_join_table :roles, :scenes do |t|
      t.index [:role_id, :scene_id]
      t.index [:scene_id, :role_id]
    end
  end
end
