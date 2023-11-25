class AddGroupReferenceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :group, null: false, foreign_key: true
  end
end
