class DemoResetJob < ApplicationJob
  queue_as :default

  # Hourly reset for the public demo. Wipes all PageContent rows and reseeds
  # from config/lean_cms_structure.yml so the next visitor sees a clean site.
  # Scheduled via config/recurring.yml at the top of every hour.
  def perform
    Rails.logger.info("[DemoResetJob] starting reset at #{Time.current.utc}")

    LeanCms::PageContent.delete_all
    result = LeanCms::Loader.new(logger: Rails.logger).load!

    # page_content / page_section / page_structure helpers in LeanCms cache
    # for 1 hour. After a reset we want visitors to see the reseeded values
    # immediately — and any stale entries from broken previous runs need to
    # go too. Clear the whole Rails cache; solid_cache rebuilds cheaply.
    Rails.cache.clear

    Rails.logger.info("[DemoResetJob] reset complete — created=#{result.created} updated=#{result.updated} skipped=#{result.skipped}")
    raise "DemoResetJob seeded zero records" if result.created.zero? && result.updated.zero?
  rescue => e
    Rails.logger.error("[DemoResetJob] reset failed: #{e.class}: #{e.message}\n#{e.backtrace&.first(8)&.join("\n")}")
    raise
  end
end
