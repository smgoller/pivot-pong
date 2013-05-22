require 'spec_helper'

describe Admin::SiteSettingsController do
  describe "#index" do
    it "assigns general settings and player settings" do
      get :index
      assigns(:general_settings).should == SiteSetting.where(setting_type: SiteSetting::GENERAL_SETTINGS)
      assigns(:player_settings).should == SiteSetting.where(setting_type: SiteSetting::PLAYER_SETTINGS)
    end
  end

  describe "#group" do
    it "updates the settings submitted by the form" do
      setting = SiteSetting.find_or_create_by_setting_type("link color", value: "foo")
      params = {site_settings: {
          "link color" => {"value" => "bar"}
      }}
      post :group, params
      setting.reload.value.should == "bar"
    end
  end
end