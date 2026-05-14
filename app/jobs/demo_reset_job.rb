class DemoResetJob < ApplicationJob
  queue_as :default

  # Hourly reset for the public demo. Wipes all PageContent rows and reseeds
  # from config/lean_cms_structure.yml so the next visitor sees a clean site.
  # Scheduled via config/recurring.yml at the top of every hour.
  #
  # Solid Queue worker processes don't load Rake tasks the way `bin/rails`
  # does, so we have to load the gem's tasks file ourselves and use
  # task.reenable so subsequent runs in the same worker process re-invoke
  # cleanly (Rake#invoke is one-shot by default).
  def perform
    Rails.logger.info("[DemoResetJob] starting reset at #{Time.current.utc}")

    require "rake"

    LeanCms::PageContent.delete_all

    unless Rake::Task.task_defined?("lean_cms:load_structure")
      Rails.application.load_tasks
      load LeanCms::Engine.root.join("lib/tasks/lean_cms.rake")
    end

    task = Rake::Task["lean_cms:load_structure"]
    task.reenable
    task.invoke

    count = LeanCms::PageContent.count
    Rails.logger.info("[DemoResetJob] reset complete, #{count} records")
    raise "DemoResetJob seeded zero records — load_structure ran but produced nothing" if count.zero?
  rescue => e
    Rails.logger.error("[DemoResetJob] reset failed: #{e.class}: #{e.message}\n#{e.backtrace&.first(8)&.join("\n")}")
    raise
  end
end
