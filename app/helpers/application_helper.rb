module ApplicationHelper
  include LeanCms::PageContentHelper

  # Top of the next hour, UTC. Used in the demo banner and reset scheduling.
  def next_reset_at
    Time.current.utc.beginning_of_hour + 1.hour
  end

  def time_until_next_reset
    seconds = (next_reset_at - Time.current).to_i
    return "any moment" if seconds <= 60

    minutes = seconds / 60
    "#{minutes} minute#{'s' unless minutes == 1}"
  end

  def nav_link_classes(active)
    if active
      "text-brand-primary"
    else
      "hover:text-brand-primary transition-colors"
    end
  end

  # Required by LeanCms::CardsSectionComponent. Renders a Heroicons-style
  # outline SVG for the named icon. Falls back to a generic dot for any
  # icon the demo doesn't define.
  CARD_ICON_PATHS = {
    "compass"  => "M12 8v4l2 2m6-2a8 8 0 11-16 0 8 8 0 0116 0z",
    "users"    => "M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z",
    "tent"     => "M3 21l9-18 9 18M9 21V11l3-3 3 3v10",
    "mountain" => "M3 19l5-9 4 7 3-5 6 7H3z",
    "sun"      => "M12 3v2m0 14v2M5 12H3m18 0h-2M5.6 5.6l1.4 1.4m10 10l1.4 1.4M5.6 18.4l1.4-1.4m10-10l1.4-1.4M16 12a4 4 0 11-8 0 4 4 0 018 0z",
    "tree"     => "M12 22V14m0 0l-5-6h10l-5 6zm-2-12l2-3 2 3",
    "moon"     => "M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"
  }.freeze

  def render_card_icon(icon_name, color = nil, _has_gradient = false)
    path = CARD_ICON_PATHS[icon_name.to_s] || "M12 12h.01"
    content_tag(:svg,
      raw(%(<path stroke-linecap="round" stroke-linejoin="round" d="#{path}" />)),
      class: "w-7 h-7",
      style: ("color: #{color};" if color.present?),
      viewBox: "0 0 24 24",
      fill: "none",
      stroke: "currentColor",
      "stroke-width": "2",
      xmlns: "http://www.w3.org/2000/svg"
    )
  end
end
