class SiteSetting < ActiveRecord::Base
  validates :setting_type, presence: true
  validate :supported_type, on: :create

  GENERAL_SETTINGS = [ "link color",
                       "link hover color",
                       "large badge color",
                       "main border color",
                       "header background color",
                       "header border color",
                       "container background color"]

  PLAYER_SETTINGS = [ "player header color",
                      "win percentage color" ]

  ALL_SETTINGS = GENERAL_SETTINGS + PLAYER_SETTINGS

  class << self
    def generate_styles
      ALL_SETTINGS.map do |setting|
        override = self.find_by_setting_type(setting).try(:value)
        send(setting.gsub(' ', '_').to_sym, override) if override.present?
      end.join('')
    end

    def link_color(attr)
      "a {color: #{attr}}"
    end

    def link_hover_color(attr)
      "a:hover {color: #{attr}}"
    end

    def large_badge_color(attr)
      ".badge-large {color: #{attr}}"
    end

    def main_border_color(attr)
      "#page {border-color: #{attr}}"
    end

    def header_background_color(attr)
      "header {background-color: #{attr}}"
    end

    def header_border_color(attr)
      "header {border-bottom-color: #{attr}}"
    end

    def player_header_color(attr)
      ".player > h1 { color: #{attr} }"
    end

    def win_percentage_color(attr)
      ".odds h3 {color: #{attr}}"
    end

    def container_background_color(attr)
      "body {background-color: #{attr}}"
    end
  end
  private

  def supported_type
    (errors[:bad_setting] << "- this setting is not allowed") if !ALL_SETTINGS.include?(setting_type)
  end
end