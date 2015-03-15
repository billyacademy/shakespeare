class AddStatsToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :num_of_lines, :integer
    add_column :roles, :longest_speech, :integer
    add_column :roles, :num_of_scenes, :integer
    add_column :roles, :percentage_of_scenes, :decimal
  end
end
