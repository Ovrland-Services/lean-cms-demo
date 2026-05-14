class User < ApplicationRecord
  has_secure_password

  # Required by the gem's notifications-bell partial in /lean-cms admin views.
  has_many :notifications, as: :recipient, dependent: :destroy, class_name: "Noticed::Notification"

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

  def display_name
    name.presence || email_address.split("@").first
  end

  def permissions_summary
    return "Super Admin" if is_super_admin?

    perms = []
    perms << "Pages"    if can_edit_pages
    perms << "Blog"     if can_edit_blog
    perms << "Users"    if can_manage_users
    perms << "Settings" if can_access_settings
    perms.empty? ? "No permissions" : perms.join(", ")
  end
end
