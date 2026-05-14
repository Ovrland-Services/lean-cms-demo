class DemoResetJob < ApplicationJob
  queue_as :default

  # Hourly reset for the public demo. Wipes all PageContent rows and reseeds
  # from config/lean_cms_structure.yml so the next visitor sees a clean site.
  # Scheduled via config/recurring.yml at the top of every hour.
  def perform
    Rails.logger.info("[DemoResetJob] starting reset at #{Time.current.utc}")

    LeanCms::PageContent.delete_all
    Rake::Task.clear
    Rails.application.load_tasks
    Rake::Task["lean_cms:load_structure"].invoke

    Rails.logger.info("[DemoResetJob] reset complete, #{LeanCms::PageContent.count} records")
  rescue => e
    Rails.logger.error("[DemoResetJob] reset failed: #{e.class}: #{e.message}")
    raise
  end
end
