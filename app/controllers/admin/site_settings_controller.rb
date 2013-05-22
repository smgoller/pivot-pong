class Admin::SiteSettingsController < Admin::BaseController
  def index
    @general_settings = SiteSetting.where(setting_type: SiteSetting::GENERAL_SETTINGS)
    @player_settings = SiteSetting.where(setting_type: SiteSetting::PLAYER_SETTINGS)
  end

  def group
    settings = params[:site_settings]
    settings.keys.each do |setting_type|
      if updateable = SiteSetting.find_by_setting_type(setting_type)
        updateable.update_column(:value, settings[setting_type]["value"])
      end
    end
    flash[:notice] = "Styles updated. Server must be restarted for changes to go into effect"
    redirect_to admin_site_settings_path
  end

  def restore_defaults
    SiteSetting.update_all(value: nil)
    flash[:notice] = "Defaults Restored. Server must be restarted for changes to go into effect"
    redirect_to admin_site_settings_path
  end
end