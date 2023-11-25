class AddGroupReferenceToProjects < ActiveRecord::Migration[7.1]
  def change
    add_reference :projects, :group, null: false, foreign_key: true
  end
end
