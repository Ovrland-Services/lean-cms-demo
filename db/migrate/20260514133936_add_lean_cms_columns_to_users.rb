class AddLeanCmsColumnsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :active, :boolean, default: true, null: false
    add_column :users, :must_change_password, :boolean, default: false, null: false
    add_column :users, :last_login_at, :datetime
    add_column :users, :is_super_admin, :boolean, default: false, null: false
    add_column :users, :can_edit_pages, :boolean, default: false, null: false
    add_column :users, :can_edit_blog, :boolean, default: false, null: false
    add_column :users, :can_manage_users, :boolean, default: false, null: false
    add_column :users, :can_access_settings, :boolean, default: false, null: false
  end
end
