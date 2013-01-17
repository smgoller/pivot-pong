module ApplicationHelper
  def link_to_with_current(name, url)
    options = (current_page? url) ? { class: "current" } : {}
    link_to name, url, options
  end

  def location
    ENV["pong_location"] || "SF"
  end

  def logo
    ENV['logo_url'] || "logo.png"
  end

  def player_avatar(player, options = {})
    img_src =  player.avatar.blank? ? "placeholder#{options unless options.empty?}.png" : player.avatar.url(options)
    image_tag img_src
  end
end
