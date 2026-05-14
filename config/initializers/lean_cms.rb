LeanCms.configure do |config|
  config.site_name       = "Slothback Outfitters"
  config.site_logo_path  = "lean_cms/sloth-logo.png"
  config.primary_color   = "#b82025"
  config.secondary_color = "#9a1b1f"
  config.admin_path      = "/lean-cms"
  config.user_class      = "User"
  config.posts_per_page  = 10
  config.portfolio_enabled = false
  config.mailer_from     = "noreply@demo.leancms.dev"
end
