class PagesController < ApplicationController
  allow_unauthenticated_access

  before_action :set_page_slug

  def home;    end
  def about;   end
  def trips;   end
  def contact; end

  private

  # @page is the convention LeanCms::PageContentHelper falls back to when
  # the section / cards / bullets helpers are called without an explicit
  # `page:` keyword.
  def set_page_slug
    @page = action_name.to_s
  end
end
