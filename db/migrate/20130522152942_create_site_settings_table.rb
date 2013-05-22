class CreateSiteSettingsTable < ActiveRecord::Migration
  def change
    create_table :site_settings do |t|
      t.string  :setting_type
      t.string  :value

      t.timestamps
    end
  end
end
