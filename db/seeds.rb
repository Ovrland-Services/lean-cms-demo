# Demo site users. Idempotent — safe to run any time and from the hourly
# DemoResetJob.
#
# - system@slothback.example  super-admin, used by the reset job to call
#                             `lean_cms:load_structure` (which writes
#                             `last_edited_by` on every PageContent record).
# - demo@leancms.dev          editor only. This is the account demo
#                             visitors log in as to try the CMS.

User.find_or_initialize_by(email_address: "system@slothback.example").tap do |u|
  u.password             = "system-not-for-login"
  u.name                 = "Slothback System"
  u.active               = true
  u.must_change_password = false
  u.is_super_admin       = true
  u.save!
end

User.find_or_initialize_by(email_address: "demo@leancms.dev").tap do |u|
  u.password             = "demo123"
  u.name                 = "Demo Editor"
  u.active               = true
  u.must_change_password = false
  u.is_super_admin       = false
  u.can_edit_pages       = true
  u.can_edit_blog        = false
  u.can_manage_users     = false
  u.can_access_settings  = false
  u.save!
end

# GA4 measurement ID — same property as the docs site so leancms.dev +
# demo.leancms.dev show up as one funnel in GA4 (filter by hostname in
# reports). The helper is a no-op when this is blank.
LeanCms::Setting.set("google_analytics_id", "G-J5BHN1GD94")
