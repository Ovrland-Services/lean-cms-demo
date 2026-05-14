class User < ApplicationRecord
  has_secure_password

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def can_edit_pages?;      is_super_admin? || can_edit_pages;      end
  def can_edit_blog?;       is_super_admin? || can_edit_blog;       end
  def can_manage_users?;    is_super_admin? || can_manage_users;    end
  def can_access_settings?; is_super_admin? || can_access_settings; end

  def has_any_cms_permission?
    can_edit_pages? || can_edit_blog? || can_manage_users? || can_access_settings?
  end

  def record_login!;         update_column(:last_login_at, Time.current); end
  def active?;               active;               end
  def must_change_password?; must_change_password; end
end
