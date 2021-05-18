class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      # postgres - case insenstive
      enable_extension('citext')

      t.citext :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tags, [:name, :user_id], unique: true
    #Ex:- add_index("admin_users", "username")
    # add key to tags, then the combination of name and user id must be uniq
  end
end
