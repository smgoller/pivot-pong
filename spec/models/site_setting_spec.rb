require 'spec_helper'

describe SiteSetting do
  it "requires a setting type" do
    SiteSetting.new.should_not be_valid
  end

  describe "#create" do
    it "should only create a valid site setting" do
      SiteSetting.new(setting_type: "foo", value: "bar").should_not be_valid
      SiteSetting.new(setting_type: SiteSetting::GENERAL_SETTINGS.first, value: "bar").should be_valid
    end
  end
end