class ChangeColumnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :admin_status, :boolean, default: false
  end
end
