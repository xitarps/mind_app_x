class ChangeColumnTagNameToRequired < ActiveRecord::Migration[6.1]
  def change
    change_column :tags, :name, :string, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
